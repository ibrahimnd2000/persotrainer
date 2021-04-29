import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persotrainer/models/chat.dart';
import 'package:persotrainer/models/chatRoom.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/widgets/persotrainer_inbox_card.dart';
import 'package:provider/provider.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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

  bool isMyProfile(String name) {
    return name == user.fullName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SafeArea(
          child: user == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
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
                            Text(
                              "Inbox",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Image.asset(
                              'assets/images/icons/filter.png',
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: StreamBuilder(
                            stream: context
                                .read<DatabaseService>()
                                .getChatRoom('Muhammad Ibrahim'),
                            builder: (context,
                                AsyncSnapshot<List<ChatRoom>> snapshot) {
                              if (!snapshot.hasData) {
                                return Container();
                              }

                              return ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    ChatRoom chatRoom = snapshot.data[index];
                                    String target;
                                    if (isMyProfile(chatRoom.users[0])) {
                                      target = chatRoom.users[1];
                                    } else {
                                      target = chatRoom.users[0];
                                    }

                                    return PersoTrainerInboxCard(
                                      title: target,
                                      chatRoomId: chatRoom.chatRoomId,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 5,
                                      ),
                                  itemCount: snapshot.data.length);
                            }),
                      ),
                    ],
                  ),
                )),
    );
  }
}
