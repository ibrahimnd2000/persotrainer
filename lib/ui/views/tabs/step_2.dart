import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/ui/widgets/persotrainer_next_button.dart';
import 'package:provider/provider.dart';

import '../../../states/signup_state.dart';

class Step2 extends StatefulWidget {
  TabController _tabController;
  Step2(this._tabController);
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
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
            "Please select your fitness level",
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView(
              children: signUpState.fitnessLevelOptions.keys.map((String key) {
                return GestureDetector(
                  onTap: () {
                    signUpState.selectFitness(key);
                  },
                  child: Container(
                    width: 85.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key,
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                              Text(
                                signUpState.fitnessLevelOptions[key][1],
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        signUpState.fitnessLevelOptions[key][0]
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
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          PersoTrainerNextButton(widget._tabController, 2),
        ],
      ),
    );
  }
}
