import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class EarningPage extends StatefulWidget {
  @override
  _EarningPageState createState() => _EarningPageState();
}

class _EarningPageState extends State<EarningPage> {
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
                    "Earnings",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Color(0xFF56606A),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 200,
                width: .95.sw,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7FC),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total Earnings",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Color(0xFF56606A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )),
                          child: DropdownButton<String>(
                            icon: Icon(CupertinoIcons.arrowtriangle_down_fill),
                            iconSize: 15.0,
                            isDense: true,
                            underline: Container(),
                            hint: Text(
                              'This Year',
                              style: GoogleFonts.poppins(
                                  fontSize: 14.0, color: Color(0xFF56606A)),
                            ),
                            items: <String>[
                              'This Year',
                              'This Month',
                              'Yesterday',
                              'Today'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.0, color: Color(0xFF56606A)),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$36,000.87",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF00AAA0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Total Clients",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF56606A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xFF00AAA0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Income History",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Color(0xFF56606A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Container(
                height: 70,
                width: .95.sw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(colors: [
                      Color(0xFF47C789),
                      Color(0xFF32B5AF),
                    ])),
                child: Center(
                  child: Text(
                    "Withdraw",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
