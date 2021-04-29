import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/ui/widgets/perotrainer_service_item.dart';
import 'package:persotrainer/ui/widgets/persotrainer_product_item.dart';

class CartPage extends StatefulWidget {
  String chatRoomId;
  CartPage({this.chatRoomId});
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F4),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.chevron_back,
                            color: Color(0xFF9998A5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFF2F2F4), width: 2),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.search,
                          color: Color(0xFF9998A5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
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
                        Positioned(
                          right: 5,
                          child: Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              borderRadius: BorderRadius.circular(5.0),
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
                            fontSize: 18,
                            color: Color(0xFF070707),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "ibrahimnd2000@gmail.com",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xFF070707),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Weight:",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Age:",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
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
                          "150 kg",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "25y/o",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Height:",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
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
                          "170 cm",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 156,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF01A7A5),
                            Color(0xFF54CD86),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icons/comment.png',
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Messaging",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 156,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF01A7A5),
                            Color(0xFF54CD86),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.video,
                            size: 15,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Video Call",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Products",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFF070707),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "41",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFFA3A3A3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Show all",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color(0xFF6389FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 180,
                  child: Container(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 41,
                        itemBuilder: (context, index) =>
                            PersoTrainerProductItem(
                              chatRoomId: widget.chatRoomId,
                            )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Services",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFF070707),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "10",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Color(0xFFA3A3A3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Show all",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Color(0xFF6389FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: Container(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) =>
                            PersoTrainerServiceItem()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
