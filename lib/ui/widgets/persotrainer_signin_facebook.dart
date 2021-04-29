import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/services/authentication_service.dart';
import 'package:provider/provider.dart';

class PersoTrainerSignInFaceBook extends StatefulWidget {
  @override
  _PersoTrainerSignInFaceBookState createState() =>
      _PersoTrainerSignInFaceBookState();
}

class _PersoTrainerSignInFaceBookState
    extends State<PersoTrainerSignInFaceBook> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AuthenticationService>().signInWithFacebook(),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Color(0xFF3966BE),
        ),
        child: Center(
          child: Text(
            "SIGN IN WITH FACEBOOK",
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
