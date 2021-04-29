import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'dart:ui' as ui;

class PersoTrainerWorkoutPlanCard extends StatefulWidget {
  @override
  _PersoTrainerWorkoutPlanCardState createState() =>
      _PersoTrainerWorkoutPlanCardState();
}

class _PersoTrainerWorkoutPlanCardState
    extends State<PersoTrainerWorkoutPlanCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.only(left: 8.0),
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                ),
              ]),
          child: CustomPaint(
            size: Size(1.sw, (1.sw * 0.7).toDouble()),
            painter: WorkoutPlanCardPainter(color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1.5k People used this service.",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Container(
                        width: .5.sw,
                        child: Text(
                          "The 10 Best Abs Workouts for Beginners.",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Francine Fisher",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: .5.sw,
          bottom: 20,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                )
              ],
            ),
            child: Center(
              child: Text(
                "\$5",
                style: GoogleFonts.poppins(
                  color: Color(0xFF21A5A5),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 30,
          child: Image.asset(
            'assets/images/bodybuilding_PNG26.png',
            height: 80,
            width: 80,
          ),
        ),
      ],
    );
  }
}

class WorkoutPlanCardPainter extends CustomPainter {
  //2
  WorkoutPlanCardPainter({@required this.color});

  //3
  final Color color;

  //4
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.66, size.height * 0.49),
        Offset(size.width * 1.00, size.height * 0.49),
        [Color(0xFF03A8A4), Color(0xFF52CC86)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 1.0006944, size.height * 0.1666667);
    path_0.quadraticBezierTo(size.width * 1.0030880, size.height * -0.0127500,
        size.width * 0.9141204, 0);
    path_0.quadraticBezierTo(size.width * 0.6594398, size.height * 0.2280833,
        size.width * 0.6583958, size.height * 0.5830833);
    path_0.quadraticBezierTo(size.width * 0.6618588, size.height * 0.9253333,
        size.width * 0.9166667, size.height);
    path_0.quadraticBezierTo(size.width * 0.9995995, size.height * 0.9998333,
        size.width, size.height * 0.8333333);
    path_0.cubicTo(
        size.width * 1.0001736,
        size.height * 0.6666667,
        size.width * 0.9987847,
        size.height * 0.6666667,
        size.width * 1.0006944,
        size.height * 0.1666667);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  //5
  @override
  bool shouldRepaint(WorkoutPlanCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
