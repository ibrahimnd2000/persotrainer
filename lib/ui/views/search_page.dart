import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:persotrainer/models/post.dart';
import 'package:persotrainer/ui/widgets/persotrainer_post.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    "Search & Categories",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: .9.sw,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Center(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Color(0xFF35BF95),
                  ),
                  child: TextFormField(
                    cursorColor: Color(0xFF35BF95),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: 35,
                      ),
                      focusColor: Color(0xFF35BF95),
                      hoverColor: Color(0xFF35BF95),
                      isDense: true,
                      hintText: 'Search',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      prefixIconConstraints: BoxConstraints(minWidth: 60),
                      contentPadding: EdgeInsets.all(12.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
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
                  text: 'Search',
                ),
                Tab(
                  text: 'Categories',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suggestions',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Search History',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 15,
                                          ),
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Lorem Ipsum has been the industry\'s',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14.0),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  CupertinoIcons
                                                      .clear_thick_circled,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                          )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Interested Services',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 20,
                                    ),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return PersoTrainerPost(
                                    post: Post(isLiked: false),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
