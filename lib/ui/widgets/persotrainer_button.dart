import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerButton extends StatefulWidget {
  String name;
  Function action;
  PersoTrainerButton(this.name, this.action);
  @override
  _PersoTrainerButtonState createState() => _PersoTrainerButtonState();
}

class _PersoTrainerButtonState extends State<PersoTrainerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            colors: [Color(0xFF52CC86), Color(0xFF03A8A4)],
          ),
        ),
        child: Center(
          child: Text(
            "${widget.name}",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
