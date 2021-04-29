import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/ui/widgets/persotrainer_next_button.dart';
import 'package:provider/provider.dart';

import '../../../states/signup_state.dart';

class Step1 extends StatefulWidget {
  TabController _tabController;
  Step1(this._tabController);
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    final signUpState = Provider.of<SignUpState>(context);
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      color: Color(0xFFFBFBFB),
      child: Column(
        children: [
          Text(
            "Check in which you are interested",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "You should choose more than more.",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView(
              children: signUpState.interestOptions.keys.map((String key) {
                return GestureDetector(
                  onTap: () {
                    signUpState.selectOptions(key);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: 85.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        )),
                    child: Row(
                      children: [
                        Text(
                          key,
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        signUpState.interestOptions[key]
                            ? Container(
                                height: 18,
                                width: 18,
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
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                )),
                              ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          PersoTrainerNextButton(widget._tabController, 1),
        ],
      ),
    );
  }
}
