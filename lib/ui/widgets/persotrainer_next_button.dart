import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/main.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:provider/provider.dart';

import '../../states/signup_state.dart';
import '../views/bottom_tabs/mainpage.dart';
import '../views/homepage.dart';

class PersoTrainerNextButton extends StatefulWidget {
  TabController _tabController;
  int index;
  PersoTrainerNextButton(this._tabController, this.index);
  @override
  _PersoTrainerNextButtonState createState() => _PersoTrainerNextButtonState();
}

class _PersoTrainerNextButtonState extends State<PersoTrainerNextButton> {
  @override
  Widget build(BuildContext context) {
    final signUpState = Provider.of<SignUpState>(context);
    return GestureDetector(
      onTap: () {
        if (widget._tabController.index == 2) {
          context.read<UserState>().createLocalUser(User(
                fullName: signUpState.fullNameTextEditingController.text,
                emailId: signUpState.emailTextEditingController.text,
                phoneNumber: signUpState.phoneNumber,
                height: signUpState.heightTextController.text,
                birthday: signUpState.birthdayTextController.text,
                weight: signUpState.weightTextController.text,
              ));
          signUpState.uploadUser(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
        } else {
          widget._tabController.animateTo(widget.index,
              curve: Curves.ease, duration: Duration(milliseconds: 500));
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            colors: [Color(0xFF52CC86), Color(0xFF03A8A4)],
          ),
        ),
        child: Center(
          child: Text(
            "NEXT",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
