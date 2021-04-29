import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/states/signup_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/sign_up.dart';
import 'package:persotrainer/ui/widgets/persotrainer_signin_button.dart';
import 'package:persotrainer/ui/widgets/persotrainer_signin_facebook.dart';
import 'package:persotrainer/ui/widgets/persotrainer_signin_google.dart';
import 'package:persotrainer/ui/widgets/persotrainer_textfield.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';
import '../../services/authentication_service.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signUpState = Provider.of<SignUpState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(
                    "Logo Here",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "WELCOME",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque enim velit, auctor et libero non, vulputate",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email ID",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PersoTrainerTextField(emailTextEditingController),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PersoTrainerTextField(
                  passTextEditingController,
                  isPass: true,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<AuthenticationService>()
                          .resetPassword(emailTextEditingController.text);
                    },
                    child: Text(
                      "Forgot Password",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Color(0xFF30ABAB)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                PersoTrainerSignInButton(
                  action: () async {
                    await context.read<AuthenticationService>().signIn(
                        context: context,
                        email: emailTextEditingController.text,
                        password: passTextEditingController.text);
                    User user = await context
                        .read<DatabaseService>()
                        .loadUser(emailTextEditingController.text);
                    var box = await Hive.openBox<User>('user');
                    box.put('LOCALUSERKEY', user);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                PersoTrainerSignInGoogleButton(),
                SizedBox(
                  height: 20,
                ),
                PersoTrainerSignInFaceBook(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Do you have an account?",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: signUpState.switchLogin,
                  child: Text(
                    "SIGN UP HERE",
                    style: GoogleFonts.poppins(
                        fontSize: 16, color: Color(0xFF30ABAB)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
