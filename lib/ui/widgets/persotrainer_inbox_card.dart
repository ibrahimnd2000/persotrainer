import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/chat.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/views/message.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/size_extension.dart';

class PersoTrainerInboxCard extends StatefulWidget {
  String title, chatRoomId;
  PersoTrainerInboxCard({this.title, this.chatRoomId});
  @override
  _PersoTrainerInboxCardState createState() => _PersoTrainerInboxCardState();
}

class _PersoTrainerInboxCardState extends State<PersoTrainerInboxCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Message(
                    chatRoomId: widget.chatRoomId,
                  ))),
      child: StreamBuilder(
          stream: context
              .read<DatabaseService>()
              .getRecentMessage(widget.chatRoomId, widget.title),
          builder: (context, AsyncSnapshot<Chat> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            Chat chat = snapshot.data;
            return Container(
              height: 75,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                )
              ]),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.title}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: .5.sw,
                        child: Text(
                          "${chat.message}",
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(int.parse(chat.timestamp)))}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFF53CE86),
                        ),
                        height: 10,
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
