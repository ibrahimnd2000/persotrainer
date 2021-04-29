import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:persotrainer/models/post.dart';
import 'package:persotrainer/states/chat_state.dart';
import 'package:persotrainer/ui/views/message.dart';
import 'package:provider/provider.dart';

class PersoTrainerPost extends StatefulWidget {
  Post post;
  Function commentAction;
  PersoTrainerPost({this.post, this.commentAction});
  @override
  _PersoTrainerPostState createState() => _PersoTrainerPostState();
}

class _PersoTrainerPostState extends State<PersoTrainerPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
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
          Stack(
            children: [
              Container(
                height: 200,
                width: 1.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1580261450046-d0a30080dc9b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=653&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ]),
                  child: Center(
                    child: LikeButton(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      padding: EdgeInsets.all(8.0),
                      size: 28,
                      isLiked: widget.post.isLiked,
                      circleColor: CircleColor(
                          start: Color(0xFF52CC86), end: Color(0xFF03A8A4)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xFF03A8A4),
                        dotSecondaryColor: Color(0xFF03A8A4),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          CupertinoIcons.heart_solid,
                          color: isLiked ? Colors.redAccent : Colors.grey,
                          size: 28,
                        );
                      },
                      likeCount: 1,
                      countBuilder: (int count, bool isLiked, String text) {
                        var color = isLiked ? Colors.redAccent : Colors.grey;
                        Widget result;
                        if (count == 0) {
                          result = Text(
                            "like",
                            style: TextStyle(color: color),
                          );
                        } else
                          result = Text(
                            text,
                            style: TextStyle(color: color),
                          );
                        return result;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
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
                            width: 5,
                            height: 8,
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
                      "${widget.post.postedBy}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
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
                    Spacer(),
                    GestureDetector(
                      onTap: () => context.read<ChatState>().sendMessage(
                          context, 'Muhammad Ibrahim', widget.post.postedBy),
                      child: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/chat.png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Chat",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "${widget.post.title}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${widget.post.description}",
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: Colors.grey.shade200,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icons/like.png',
                      height: 20,
                      width: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${widget.post.likes} ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Likes",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.commentAction,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/icons/comment.png',
                            height: 20,
                            width: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${widget.post.comments} ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Comment",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.arrowshape_turn_up_right_fill,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${widget.post.shares} ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Share",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
