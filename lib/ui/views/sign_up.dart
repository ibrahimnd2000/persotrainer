import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/services/authentication_service.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/states/signup_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/sign_in.dart';
import 'package:persotrainer/ui/widgets/persotrainer_signin_button.dart';
import 'package:persotrainer/ui/widgets/persotrainer_textfield.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../states/signup_state.dart';
import 'details.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    "SIGN UP",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem ipsum dolor sit amet",
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
                    "Full Name",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                PersoTrainerTextField(
                    signUpState.fullNameTextEditingController),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email ID",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                PersoTrainerTextField(signUpState.emailTextEditingController),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                PersoTrainerTextField(
                  signUpState.passwordTextEditingController,
                  isPass: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                PersoTrainerTextField(
                  signUpState.confirmPassTextEditingController,
                  isPass: true,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone Number",
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                InternationalPhoneNumberInput(
                    initialValue: PhoneNumber(isoCode: "US"),
                    inputBorder: OutlineInputBorder(),
                    formatInput: true,
                    maxLength: 12,
                    onInputChanged: (value) {
                      signUpState.phoneNumber = value.toString();
                    }),
                SizedBox(
                  height: 30,
                ),
                PersoTrainerSignInButton(
                  action: () async {
                    context
                        .read<AuthenticationService>()
                        .signUp(
                            email: signUpState.emailTextEditingController.text
                                .trim(),
                            password: signUpState
                                .passwordTextEditingController.text
                                .trim())
                        .then((value) {
                      print(value);
                      if (value == 'Signed Up') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Details()));
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Have already an account?",
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
