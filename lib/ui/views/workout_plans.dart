import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/widgets/persotrainer_workout_plan_card.dart';

class WorkoutPlans extends StatefulWidget {
  @override
  _WorkoutPlansState createState() => _WorkoutPlansState();
}

class _WorkoutPlansState extends State<WorkoutPlans> {
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
              height: 130,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Workout Plans",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            CupertinoIcons.search,
                            size: 30,
                          ),
                        ),
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Plans",
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.grey,
                              )),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => PersoTrainerWorkoutPlanCard(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: 2,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
