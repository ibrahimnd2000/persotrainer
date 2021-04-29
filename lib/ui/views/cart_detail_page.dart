import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/chat.dart';
import 'package:persotrainer/models/requests/extra_attributes.dart';
import 'package:persotrainer/models/requests/items.dart';
import 'package:persotrainer/models/requests/parties.dart';
import 'package:persotrainer/models/requests/schedule.dart';
import 'package:persotrainer/models/requests/transaction.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/services/escrow_service.dart';
import 'package:persotrainer/ui/views/appointment_screen.dart';
import 'package:provider/provider.dart';

class CartDetailPage extends StatefulWidget {
  String chatRoomId;
  CartDetailPage({this.chatRoomId});
  @override
  _CartDetailPageState createState() => _CartDetailPageState();
}

class _CartDetailPageState extends State<CartDetailPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int count = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: .25.sh,
                      decoration: BoxDecoration(
                          color: Color(0xFFF2F2F2),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0))),
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "How to be best runner!",
                            style: GoogleFonts.poppins(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Spacer(),
                          // Container(
                          //   height: 40,
                          //   width: 40,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20),
                          //     color: Color(0xFF50CB87),
                          //   ),
                          //   child: Center(
                          //     child: Icon(
                          //       CupertinoIcons.arrowshape_turn_up_right_fill,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
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
                          Text(
                            "Muhammad Ibrahim",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
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
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Away from you ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "50kms",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentScreen(),
                              ),
                            ),
                            child: Container(
                              width: 134,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFF53D187),
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Center(
                                child: Text(
                                  "Appointment 40\$",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFF35BF95),
                  unselectedLabelColor: Colors.black87,
                  indicatorColor: Color(0xFF35BF95),
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600),
                  tabs: [
                    Tab(
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Packages",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Reviews",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(
                        child: Text(
                          'Description',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Packages',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Reviews',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                width: 105,
                height: 36,
                decoration: BoxDecoration(
                    color: Color(0xFF53D187),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Center(
                    child: Text(
                  "Get Service",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
