import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerSignInButton extends StatefulWidget {
  Function action;

  PersoTrainerSignInButton({this.action});
  @override
  _PersoTrainerSignInButtonState createState() =>
      _PersoTrainerSignInButtonState();
}

class _PersoTrainerSignInButtonState extends State<PersoTrainerSignInButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
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
            "SIGN IN",
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
