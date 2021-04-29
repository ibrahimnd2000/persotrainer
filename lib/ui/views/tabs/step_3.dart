import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/widgets/persotrainer_next_button.dart';
import 'package:persotrainer/ui/widgets/persotrainer_textfield.dart';
import 'package:provider/provider.dart';

import '../../../states/signup_state.dart';

class Step3 extends StatefulWidget {
  TabController _tabController;
  Step3(this._tabController);
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  DateTime selectedDate = DateTime.now();
  bool isActive = false;
  double position = 37;

  toggleSwitch() {
    if (isActive) {
      setState(() {
        isActive = false;
        position = 37;
      });
    } else {
      setState(() {
        isActive = true;
        position = 3;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = Provider.of<SignUpState>(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      color: Color(0xFFFBFBFB),
      child: ListView(
        children: [
          Text(
            "Personal Details",
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Let us know about you to speed up the result, Get fit with your personal workout plan!",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apple Health",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Allow access to fill my parameters.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  isActive
                      ? Container(
                          width: 75,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF04A8A3),
                                  Color(0xFF4ECA87),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        )
                      : Container(
                          width: 75,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                  Positioned(
                    right: position,
                    child: GestureDetector(
                      onTap: toggleSwitch,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black87, blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Birthday",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          PersoTrainerTextField(
            signUpState.birthdayTextController,
            isBirthday: true,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Weight",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          PersoTrainerTextField(
            signUpState.weightTextController,
            isNum: true,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Height",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black54,
            ),
          ),
          PersoTrainerTextField(
            signUpState.heightTextController,
            isNum: true,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Gender",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: signUpState.genderOptions.keys.map((String key) {
                    return GestureDetector(
                      onTap: () {
                        signUpState.selectGender(key);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            signUpState.genderOptions[key]
                                ? Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF4DCA88),
                                            Color(0xFF07A9A2),
                                          ],
                                        )),
                                    child: Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                                  )
                                : Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey),
                                    child: Center(
                                        child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              key,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // SizedBox(
              //   width: 25,
              // ),
              // GestureDetector(
              //   onTap: toggleGender,
              //   child: Container(
              //     child: Row(
              //       children: [
              //         !isSelected
              //             ? Container(
              //                 height: 20,
              //                 width: 20,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(15),
              //                     gradient: LinearGradient(
              //                       colors: [
              //                         Color(0xFF4DCA88),
              //                         Color(0xFF07A9A2),
              //                       ],
              //                     )),
              //                 child: Center(
              //                     child: Icon(
              //                   Icons.check,
              //                   color: Colors.white,
              //                   size: 15,
              //                 )),
              //               )
              //             : Container(
              //                 height: 20,
              //                 width: 20,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15),
              //                   color: Colors.grey,
              //                 ),
              //                 child: Center(
              //                     child: Icon(
              //                   Icons.check,
              //                   color: Colors.white,
              //                   size: 15,
              //                 )),
              //               ),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         Text(
              //           "Female",
              //           style: GoogleFonts.poppins(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w300,
              //             color: Colors.black87,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 55,
          ),
          PersoTrainerNextButton(widget._tabController, 2),
        ],
      ),
    );
  }
}
