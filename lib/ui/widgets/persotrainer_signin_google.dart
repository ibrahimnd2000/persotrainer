import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/main.dart';
import 'package:persotrainer/services/authentication_service.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/views/details.dart';
import 'package:provider/provider.dart';

class PersoTrainerSignInGoogleButton extends StatefulWidget {
  @override
  _PersoTrainerSignInGoogleButtonState createState() =>
      _PersoTrainerSignInGoogleButtonState();
}

class _PersoTrainerSignInGoogleButtonState
    extends State<PersoTrainerSignInGoogleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String email =
            await context.read<AuthenticationService>().signInWithGoogle();
        bool emailExists =
            await context.read<DatabaseService>().doesEmailExists(email);
        print(email);
        if (emailExists) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Details()));
        }
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SIGN IN WITH GOOGLE",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
