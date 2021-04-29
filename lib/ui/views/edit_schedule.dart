import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/models/meeting_model.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:provider/provider.dart';

class EditSchedule extends StatefulWidget {
  @override
  _EditScheduleState createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  bool isCheck = false;
  DateTime startFrom;
  DateTime endTo;
  TextEditingController trainingTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startFrom = DateTime.now().add(Duration(hours: 1));
    endTo = DateTime.now().add(Duration(minutes: 45));
  }

  void _showDatePicker(BuildContext ctx, String type) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        minimumDate: DateTime.now(),
                        minimumYear: DateTime.now().year,
                        use24hFormat: false,
                        initialDateTime:
                            type == 'startFrom' ? startFrom : endTo,
                        onDateTimeChanged: (val) {
                          setState(() {
                            if (type == 'startFrom') {
                              startFrom = val;
                            } else {
                              endTo = val;
                            }
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Row(
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
                      "Add Event",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      "Edit Schedule",
                      style: GoogleFonts.poppins(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Training Title",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: trainingTitleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Start from:",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () => _showDatePicker(context, 'startFrom'),
                      child: Container(
                        width: 1.sw,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('EEEE dd, y hh:mm a').format(startFrom),
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "End till:",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDatePicker(context, 'endTo');
                      },
                      child: Container(
                        width: 1.sw,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            DateFormat('EEEE dd, y hh:mm a').format(endTo),
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isCheck,
                            onChanged: (bool value) {
                              setState(() {
                                isCheck = value;
                              });
                            }),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Do you want it for all-day ?',
                          style: GoogleFonts.poppins(fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Meeting meeting = Meeting(trainingTitleController.text,
                      startFrom, endTo, '0xFFFFFF', isCheck);
                  context
                      .read<DatabaseService>()
                      .addSchedule('ibrahimnd2000@gmail.com', meeting);
                  Navigator.pop(context);
                },
                child: Container(
                  width: .4.sw,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'Done',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
