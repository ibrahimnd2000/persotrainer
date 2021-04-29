import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: .25.sh,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.chevron_back,
                              color: Color(0xFF9998A5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  top: 2,
                                  child: Container(
                                    width: 9,
                                    height: 9,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF29F31A),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Muhammad Ibrahim",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Athletic Instructors",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.star_fill,
                                      color: Color(0xFFFFCC00),
                                      size: 14,
                                    ),
                                    Text(
                                      "4.8",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "(46)",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appointment",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Day DD/MM/YY 00:00AM",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 134,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFF53D187),
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Center(
                                child: Text(
                                  "Select date & time",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "First Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "First Name",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(12.0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Address",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(12.0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "+1 234 564 221",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(12.0),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 46,
                              width: 146,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color(0xFF53D187),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/icons/wallet.png',
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cash",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 46,
                              width: 146,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFF53D187))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/icons/credit-card.png',
                                    height: 25,
                                    width: 25,
                                    color: Color(0xFF53D187),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cash",
                                    style: TextStyle(
                                      color: Color(0xFF53D187),
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              width: .95.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF01A7A5),
                                    Color(0xFF54CD86),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "BOOKING",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 1,
                  //   color: Colors.grey,
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(10.0),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "Total Cost:",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //       Text(
                  //         " 29.99\$",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       Text(
                  //         "+ Credit Card Fees: 10%",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     context.read<DatabaseService>().addMessage(
                  //         widget.chatRoomId,
                  //         Chat(
                  //             timestamp: DateTime.now()
                  //                 .millisecondsSinceEpoch
                  //                 .toString(),
                  //             sendBy: 'Muhammad Ibrahim',
                  //             message:
                  //                 'Muhammad Ibrahim has sent you an offer. Tap to review.'));
                  //     context.read<EscrowService>().createTransaction(Transaction(
                  //             parties: [
                  //               Parties(
                  //                 role: 'buyer',
                  //                 customer: 'ibrahimnd2000@gmail.com',
                  //               ),
                  //               Parties(
                  //                 role: 'seller',
                  //                 customer: 'ibrahimnd2000@gmail.com',
                  //               ),
                  //               Parties(
                  //                 role: 'broker',
                  //                 customer: 'me',
                  //               ),
                  //             ],
                  //             description: 'The sale of How to be best runner!',
                  //             items: [
                  //               Items(
                  //                 title: "How to be best runner!",
                  //                 description:
                  //                     "The sale of how to be best runner",
                  //                 type: "general_merchandise",
                  //                 inspectionPeriod: 0,
                  //                 quantity: 1,
                  //                 extraAttributes:
                  //                     ExtraAttributes(withContent: false),
                  //                 schedule: [
                  //                   Schedule(
                  //                     amount: 29,
                  //                     beneficiaryCustomer:
                  //                         'ibrahimnd2000@gmail.com',
                  //                     payerCustomer: 'ibrahimnd2000@gmail.com',
                  //                   )
                  //                 ],
                  //               ),
                  //               Items(type: "broker_fee", schedule: [
                  //                 Schedule(
                  //                   amount: 250,
                  //                   payerCustomer: 'ibrahimnd2000@gmail.com',
                  //                   beneficiaryCustomer:
                  //                       'ibrahimnd2000@gmail.com',
                  //                 ),
                  //               ]),
                  //             ],
                  //             currency: 'usd')
                  //         .toJson());
                  //     Navigator.popUntil(context, (route) => count++ == 2);
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     width: .95.sw,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         gradient: LinearGradient(colors: [
                  //           Color(0xFF47C789),
                  //           Color(0xFF32B5AF),
                  //         ])),
                  //     child: Center(
                  //       child: Text(
                  //         "Send Offer",
                  //         style: GoogleFonts.poppins(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
