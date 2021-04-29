import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/states/seller_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/bottom_tabs/mainpage.dart';
import 'package:persotrainer/ui/views/bottom_tabs/manage_order.dart';
import 'package:persotrainer/ui/views/bottom_tabs/profile.dart';
import 'package:persotrainer/ui/views/inbox.dart';
import 'package:persotrainer/ui/views/profile_page.dart';
import 'package:persotrainer/ui/views/workout_plans.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sellerState = Provider.of<SellerState>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: Container(
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          child: BottomNavigationBar(
            fixedColor: Colors.black,
            currentIndex: _currentIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      'assets/images/icons/home.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      sellerState.isSeller
                          ? 'assets/images/icons/mail.png'
                          : 'assets/images/icons/search.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  label: sellerState.isSeller ? 'Inbox' : 'Search'),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      sellerState.isSeller
                          ? 'assets/images/icons/clipboard.png'
                          : 'assets/images/icons/weight.png',
                      height: 35,
                      width: 35,
                    ),
                  ),
                  label:
                      sellerState.isSeller ? 'Manage Orders' : 'Workout Plans'),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Icon(
                      CupertinoIcons.bell,
                      size: 35,
                    ),
                  ),
                  label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Icon(
                      CupertinoIcons.person,
                      size: 35,
                    ),
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
      body: sellerState.generateTabs(_currentIndex),
    );
  }
}
