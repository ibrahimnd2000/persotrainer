import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class PersoTrainerOrder extends StatefulWidget {
  @override
  _PersoTrainerOrderState createState() => _PersoTrainerOrderState();
}

class _PersoTrainerOrderState extends State<PersoTrainerOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          SizedBox(
            width: .55.sw,
            child: Column(
              children: [
                Text(
                  "The 10 Best Abs Workouts for Begineers",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Date:",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "4 Jan, 2020",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Amount:",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "5\$",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
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
                    SizedBox(
                      width: 80,
                      child: Text(
                        "Muhammad Ibrahim",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/icons/chat.png',
                      height: 15,
                      width: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Chat",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Deliver With in 2 days",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFB0E8C7)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1521805103424-d8f8430e8933?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xFFD7F3E3),
                  ),
                  child: Center(
                    child: Text(
                      "Progress",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF29A75D),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
