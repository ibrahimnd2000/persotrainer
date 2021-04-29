import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerServiceTextField extends StatefulWidget {
  String hintText, asset;
  TextEditingController controller;
  PersoTrainerServiceTextField({this.hintText, this.asset, this.controller});
  @override
  _PersoTrainerServiceTextFieldState createState() =>
      _PersoTrainerServiceTextFieldState();
}

class _PersoTrainerServiceTextFieldState
    extends State<PersoTrainerServiceTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      width: .72.sw,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFF4ECB87),
            )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey.shade200,
            )),
            isCollapsed: true,
            isDense: true,
            contentPadding: EdgeInsets.all(10.0),
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.w500),
            prefixIcon: Container(
              height: 18,
              width: 18,
              child: Center(
                child: Image.asset(
                  'assets/images/icons/${widget.asset}.png',
                  height: 18,
                  width: 18,
                  color: Colors.grey.shade300,
                  fit: BoxFit.contain,
                ),
              ),
            )),
      ),
    );
  }
}
