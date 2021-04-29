import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/ui/widgets/persotrainer_inbox_card.dart';
import 'package:persotrainer/ui/widgets/persotrainer_post.dart';

class FavPosts extends StatefulWidget {
  @override
  _FavPostsState createState() => _FavPostsState();
}

class _FavPostsState extends State<FavPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                  )
                ],
              ),
              height: 80,
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(CupertinoIcons.chevron_back)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Favorite Posts",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PersoTrainerPost(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 5),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
