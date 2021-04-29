import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/services/authentication_service.dart';
import 'package:persotrainer/states/seller_state.dart';
import 'package:persotrainer/states/signup_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/edit_profile.dart';
import 'package:persotrainer/ui/views/fav_posts.dart';
import 'package:persotrainer/ui/views/sign_up.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;
  User user;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    loadLocalUser();
  }

  loadLocalUser() async {
    user = await Provider.of<UserState>(context, listen: false).loadLocalUser();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                            horizontal: 12.0, vertical: 16.0),
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
                                  width: 60,
                                  height: 60,
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
                                      '${user.fullName ?? ''}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "${user.emailId ?? ''}",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
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
                                      "${user.weight ?? '0'}kg",
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
                                      "${user.height ?? '0'}cm",
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
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile())),
                              child: Container(
                                alignment: Alignment.center,
                                width: .95.sw,
                                height: 45,
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/edit.png',
                                      height: 20,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit Profile",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 10,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white,
                              ),
                              height: 250,
                              child: Column(
                                children: [
                                  TabBar(
                                    controller: _tabController,
                                    indicatorColor: Color(0xFF3FBFA2),
                                    tabs: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Basic",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "15\$",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Silver",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "20\$",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Premium",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "30\$",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text("1"),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text("2"),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text("2"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FavPosts())),
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
                                                  'assets/images/icons/post.png'),
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
                                            "Favorite Posts",
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
                                                'assets/images/icons/heart.png'),
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
                                          "Wishlist",
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
                                          "Order History",
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
                                          "My workout plans",
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
                                                'assets/images/icons/add-user.png'),
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
                                          "Invite friends",
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
                                    onTap: () {
                                      context
                                          .read<UserState>()
                                          .deleteLocalUser();
                                      context
                                          .read<AuthenticationService>()
                                          .signOut();
                                    },
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
                                                  'assets/images/icons/logout.png'),
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
                                            "Logout",
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
