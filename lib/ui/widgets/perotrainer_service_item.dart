import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerServiceItem extends StatefulWidget {
  @override
  _PersoTrainerServiceItemState createState() =>
      _PersoTrainerServiceItemState();
}

class _PersoTrainerServiceItemState extends State<PersoTrainerServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: .5.sw,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(12.0)),
          ),
          Row(
            children: [
              Text(
                "How to be best runner!",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF36C499),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Available now!",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF36C499),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "4.99\$/hr",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFB3B3B3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
