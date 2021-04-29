import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/meeting_model.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/services/meeting_data_source.dart';
import 'package:persotrainer/ui/views/edit_schedule.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:intl/intl.dart';

class AvailabilityPage extends StatefulWidget {
  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  CalendarController calendarController;
  DateTime _startFrom;
  DateTime _endTo;
  bool isCheck = true;
  bool showEdit = false;

  // Dialog texts
  String _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';
  Color _headerColor, _viewHeaderColor, _calendarColor;

  @override
  void initState() {
    super.initState();
    _startFrom = DateTime.now();
    _endTo = DateTime.now().add(Duration(hours: 1));

    calendarController = CalendarController();
    print(calendarController.view);
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment ||
        details.targetElement == CalendarElement.agenda) {
      final Meeting meetingDetails = details.appointments[0];
      _subjectText = meetingDetails.eventName;
      _dateText =
          DateFormat('MMMM dd, yyyy').format(meetingDetails.from).toString();
      _startTimeText =
          DateFormat('hh:mm a').format(meetingDetails.from).toString();
      _endTimeText = DateFormat('hh:mm a').format(meetingDetails.to).toString();
      if (meetingDetails.isAllDay) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: new Text('$_subjectText')),
              content: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(''),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditSchedule()));
                    },
                    child: new Text('Edit')),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('Close'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        CupertinoIcons.back,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Set your availability",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: !showEdit,
                  child: Container(
                    height: .7.sh,
                    child: StreamBuilder(
                      stream: context
                          .read<DatabaseService>()
                          .getSchedules('ibrahimnd2000@gmail.com'),
                      builder:
                          (context, AsyncSnapshot<List<Meeting>> snapshot) {
                        if (!snapshot.hasData) return Container();
                        print(snapshot.data.first);
                        return SfCalendar(
                          onTap: calendarTapped,
                          monthViewSettings: MonthViewSettings(
                            showAgenda: true,
                            showTrailingAndLeadingDates: false,
                            agendaItemHeight: 50,
                            agendaStyle: AgendaStyle(
                                appointmentTextStyle:
                                    GoogleFonts.poppins(fontSize: 14)),
                            monthCellStyle: MonthCellStyle(),
                          ),
                          minDate: DateTime.now(),
                          controller: calendarController,
                          dataSource: MeetingDataSource(snapshot.data),
                          showNavigationArrow: true,
                          allowViewNavigation: false,
                          view: CalendarView.month,
                          viewNavigationMode: ViewNavigationMode.snap,
                          showDatePickerButton: true,
                          headerStyle: CalendarHeaderStyle(
                            textStyle: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Visibility(
                //   visible: showEdit,
                //   child: Container(
                //     child: Column(
                //       children: [
                //         Text(
                //           "Edit Schedule",
                //           style: GoogleFonts.poppins(
                //               fontSize: 24, fontWeight: FontWeight.w500),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "Training Title",
                //               style: GoogleFonts.poppins(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         TextField(
                //           decoration: InputDecoration(
                //             border: OutlineInputBorder(),
                //             isDense: true,
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "Start from:",
                //               style: GoogleFonts.poppins(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         GestureDetector(
                //           onTap: () => _showDatePicker(context, _startFrom),
                //           child: Container(
                //             width: 1.sw,
                //             height: 50,
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //             child: Center(
                //               child: Text(
                //                 DateFormat('EEEE dd, y hh:mm a')
                //                     .format(_startFrom),
                //                 style: GoogleFonts.poppins(fontSize: 18),
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           children: [
                //             Text(
                //               "End till:",
                //               style: GoogleFonts.poppins(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w400,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         GestureDetector(
                //           onTap: () => _showDatePicker(context, _endTo),
                //           child: Container(
                //             width: 1.sw,
                //             height: 50,
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //             child: Center(
                //               child: Text(
                //                 DateFormat('EEEE dd, y hh:mm a').format(_endTo),
                //                 style: GoogleFonts.poppins(fontSize: 18),
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Checkbox(
                //                 value: isCheck,
                //                 onChanged: (bool value) {
                //                   setState(() {
                //                     isCheck = value;
                //                   });
                //                 }),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             Text(
                //               'Do you want it for all-day ?',
                //               style: GoogleFonts.poppins(fontSize: 18),
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditSchedule())),
                  child: Container(
                    width: .4.sw,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Add Event',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// List<Meeting> _getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime.now().add(Duration(days: 1));
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 9, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));
//   meetings.add(Meeting(
//       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//   return meetings;
// }
