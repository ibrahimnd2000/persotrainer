import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                  )
                ]),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        CupertinoIcons.chevron_back,
                        color: Color(0xFF56606A),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Verification Center",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF56606A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Proof of Identification",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Select your ID type",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          width: .9.sw,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white,
                          ),
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            underline: Container(),
                            iconEnabledColor: Colors.grey,
                            iconDisabledColor: Colors.grey,
                            hint: Text(
                              "ID Type",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Upload file",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 125,
                          width: .9.sw,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: DottedBorder(
                            dashPattern: [5],
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 16.0,
                            ),
                            strokeWidth: 2,
                            color: Color(0xFF53D187),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 147,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF53D187),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Choose File",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "ID-file.jpg",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Allowed Documents jpg,\npng, pdf, tiff\nand maximum size\nis 100KB.",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Proof of Address",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Document Type",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          width: .9.sw,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white,
                          ),
                          child: DropdownButton<String>(
                            isDense: true,
                            isExpanded: true,
                            underline: Container(),
                            iconEnabledColor: Colors.grey,
                            iconDisabledColor: Colors.grey,
                            hint: Text(
                              "Select Doc Type",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Upload file",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 125,
                          width: .9.sw,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: DottedBorder(
                            dashPattern: [5],
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 16.0,
                            ),
                            strokeWidth: 2,
                            color: Color(0xFF53D187),
                            borderType: BorderType.RRect,
                            radius: Radius.circular(8),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 147,
                                      height: 38,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF53D187),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Choose File",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "ID-file.jpg",
                                      style: GoogleFonts.poppins(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Allowed Documents jpg,\npng, pdf, tiff\nand maximum size\nis 100KB.",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: .91.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF01A7A5),
                          Color(0xFF54CD86),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "SAVE & CONTINUE",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
