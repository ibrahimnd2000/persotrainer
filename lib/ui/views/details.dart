import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/ui/views/tabs/step_1.dart';
import 'package:persotrainer/ui/views/tabs/step_2.dart';
import 'package:persotrainer/ui/views/tabs/step_3.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int index = 0;
  Color disabledColor = Color(0xFFE1F7EA);
  Color enabledColor = Color(0xFF53D187);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: index);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Step ${_tabController.index + 1} of 3",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
              controller: _tabController,
              labelColor: Colors.blue,
              isScrollable: true,
              onTap: (index) {
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              tabs: <Widget>[
                Container(
                  height: 5,
                  width: .3.sw,
                  color:
                      _tabController.index == 0 ? enabledColor : disabledColor,
                ),
                Container(
                  height: 5,
                  width: .3.sw,
                  color:
                      _tabController.index == 1 ? enabledColor : disabledColor,
                ),
                Container(
                  height: 5,
                  width: .3.sw,
                  color:
                      _tabController.index == 2 ? enabledColor : disabledColor,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Step1(_tabController),
                  Step2(_tabController),
                  Step3(_tabController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
