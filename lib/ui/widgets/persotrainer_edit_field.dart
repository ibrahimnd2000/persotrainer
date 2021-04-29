import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerEditField extends StatefulWidget {
  String title;
  PersoTrainerEditField({this.title});
  @override
  _PersoTrainerEditFieldState createState() => _PersoTrainerEditFieldState();
}

class _PersoTrainerEditFieldState extends State<PersoTrainerEditField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.title}",
            style: GoogleFonts.poppins(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
