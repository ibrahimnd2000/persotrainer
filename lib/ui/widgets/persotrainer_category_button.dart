import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerCategoryButton extends StatefulWidget {
  String type, asset;
  PersoTrainerCategoryButton({this.type, this.asset});
  @override
  _PersoTrainerCategoryButtonState createState() =>
      _PersoTrainerCategoryButtonState();
}

class _PersoTrainerCategoryButtonState
    extends State<PersoTrainerCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ShaderMask(
            child: Image(
              image: AssetImage("${widget.asset}"),
              height: 45,
              width: 45,
            ),
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF54C4C1), Color(0xFF6BD397)],
                stops: [
                  0.0,
                  1.0,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
          ),
          Spacer(),
          Text(
            "${widget.type}",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
