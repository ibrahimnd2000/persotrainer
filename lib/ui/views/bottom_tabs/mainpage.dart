import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/post.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/widgets/persotrainer_category_button.dart';
import 'package:persotrainer/ui/widgets/persotrainer_post.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../services/authentication_service.dart';

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  PanelController panelController = PanelController();
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.0),
                    height: 130,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      )
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "LOGO HERE",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey.shade200,
                          ),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  CupertinoIcons.search,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "What are you looking for?",
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Popular Services",
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "View all",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0xFF85DBA8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PersoTrainerCategoryButton(
                              asset: 'assets/images/icons/lotus-position.png',
                              type: "Yoga",
                            ),
                            PersoTrainerCategoryButton(
                              asset: 'assets/images/icons/dumbbell.png',
                              type: "Gym",
                            ),
                            PersoTrainerCategoryButton(
                              asset: 'assets/images/icons/running.png',
                              type: "Running",
                            ),
                            PersoTrainerCategoryButton(
                              asset: 'assets/images/icons/fitness.png',
                              type: "Weight loss",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: StreamBuilder(
                        stream: context.read<DatabaseService>().getPosts(),
                        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                          if (snapshot.data == null) return Text("Error");
                          if (!snapshot.hasData) return Container();
                          return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 20,
                                  ),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return PersoTrainerPost(
                                  post: snapshot.data[index],
                                  commentAction: () {
                                    panelController.open();
                                    setState(() {
                                      visible = true;
                                    });
                                  },
                                );
                              });
                        }),
                  ),
                ],
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: visible,
              child: SlidingUpPanel(
                minHeight: 100,
                controller: panelController,
                borderRadius: radius,
                panel: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Comments',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                onPanelClosed: () {
                  setState(() {
                    visible = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
