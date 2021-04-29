import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/widgets/persotrainer_edit_field.dart';
import 'package:persotrainer/ui/widgets/persotrainer_textfield.dart';
import 'package:flutter_screenutil/size_extension.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController fullNameTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: 80,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 16.0,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(CupertinoIcons.chevron_back)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Column(
                  children: [
                    PersoTrainerEditField(
                      title: 'Full Name',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PersoTrainerEditField(
                      title: 'Email',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PersoTrainerEditField(
                      title: 'Height',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PersoTrainerEditField(
                      title: 'Weight',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    PersoTrainerEditField(
                      title: 'Age',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: .4.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xFF5DCBAE)),
                          ),
                          child: Center(
                            child: Text(
                              "Back to Home",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF5DCBAE),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: .4.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Color(0xFF5DCBAE),
                          ),
                          child: Center(
                            child: Text(
                              "Save Changes",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
