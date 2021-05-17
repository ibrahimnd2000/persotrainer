import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/states/seller_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/add_a_service.dart';
import 'package:persotrainer/ui/views/add_categories.dart';
import 'package:persotrainer/ui/views/add_product_to_category.dart';
import 'package:persotrainer/ui/views/availability.dart';
import 'package:persotrainer/ui/views/bottom_tabs/manage_order.dart';
import 'package:persotrainer/ui/views/create_category.dart';
import 'package:persotrainer/ui/views/earning_page.dart';
import 'package:persotrainer/ui/views/edit_profile_seller.dart';
import 'package:persotrainer/ui/views/my_packages.dart';
import 'package:persotrainer/ui/views/verification_screen.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user;
  @override
  void initState() {
    super.initState();
    loadLocalUser();
  }

  loadLocalUser() async {
    user = await Provider.of<UserState>(context, listen: false).loadLocalUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sellerState = Provider.of<SellerState>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: user == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.fullName,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      user.emailId,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 40,
                                  width: 45,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 15,
                                        child: Transform.rotate(
                                          angle: math.pi / 4,
                                          child: Icon(
                                            CupertinoIcons.arrow_turn_left_up,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 15,
                                          left: 20,
                                          child: Transform.rotate(
                                            angle: math.pi / 4,
                                            child: Icon(
                                              CupertinoIcons
                                                  .arrow_turn_right_down,
                                              size: 15,
                                            ),
                                          )),
                                      Positioned(
                                        top: 1,
                                        left: 12,
                                        child: Icon(CupertinoIcons.person_alt,
                                            size: 15,
                                            color: sellerState.isSeller
                                                ? Color(0xFF04A8A3)
                                                : Colors.black),
                                      ),
                                      Positioned(
                                        top: 3,
                                        left: 24,
                                        child: Text(
                                          'Seller',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: sellerState.isSeller
                                                  ? Color(0xFF04A8A3)
                                                  : Colors.black),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 10,
                                        child: Icon(CupertinoIcons.person_alt,
                                            size: 15,
                                            color: !sellerState.isSeller
                                                ? Color(0xFF04A8A3)
                                                : Colors.black),
                                      ),
                                      Positioned(
                                        bottom: 1,
                                        left: 22,
                                        child: Text(
                                          'Buyer',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: !sellerState.isSeller
                                                  ? Color(0xFF04A8A3)
                                                  : Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    sellerState.isSeller
                                        ? Container(
                                            width: 37.5,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF04A8A3),
                                                    Color(0xFF4ECA87),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 37.5,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                          ),
                                    Positioned(
                                      right: sellerState.position,
                                      child: GestureDetector(
                                        onTap: sellerState.toggleSwitch,
                                        child: Container(
                                          width: 17.5,
                                          height: 17.5,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87,
                                                  blurRadius: 1)
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Beginner Level Seller",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade600,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Bio:",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: .75.sw,
                                          child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Skills:",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: .75.sw,
                                          child: Text(
                                            "Technical Knowledge, Motivation, Instructor",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Tags:",
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Assets",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfileSeller())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/edit.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Edit Profile",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AvailabilityPage())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/calendar.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Set Availability",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerificationScreen())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/verified.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Verification Center",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EarningPage())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/earn-money.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Earnings",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 12.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        ShaderMask(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/icons/clock.png'),
                                            height: 25,
                                            width: 25,
                                          ),
                                          shaderCallback: (Rect bounds) {
                                            return LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFF54C4C1),
                                                Color(0xFF6BD397)
                                              ],
                                              stops: [
                                                0.0,
                                                1.0,
                                              ],
                                            ).createShader(bounds);
                                          },
                                          blendMode: BlendMode.srcATop,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Orders",
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyPackages())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/box (1).png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "My Packages/Bundles",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ManageOrder(),
                                        )),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/box.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Manage orders",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 16.0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "General",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddAService())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/draw.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Add Products",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddCategory(),
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/list.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Add Categories",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreateCategory())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/draw.png'),
                                              height: 25,
                                              width: 25,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Create Category",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddProductToCategory())),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(16.0),
                                          bottomLeft: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          ShaderMask(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/icons/box (1).png'),
                                              height: 30,
                                              width: 30,
                                            ),
                                            shaderCallback: (Rect bounds) {
                                              return LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFF54C4C1),
                                                  Color(0xFF6BD397)
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ).createShader(bounds);
                                            },
                                            blendMode: BlendMode.srcATop,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Add Products to category",
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
