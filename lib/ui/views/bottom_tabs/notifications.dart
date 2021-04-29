import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                  )
                ],
              ),
              height: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    "Notifications",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/images/icons/filter.png',
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
