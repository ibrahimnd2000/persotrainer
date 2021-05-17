import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackages extends StatefulWidget {
  @override
  _MyPackagesState createState() => _MyPackagesState();
}

class _MyPackagesState extends State<MyPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            Row(
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
                  "My Packages",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: Color(0xFF56606A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
