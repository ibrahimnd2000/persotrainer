import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persotrainer/models/chat.dart';
import 'package:persotrainer/models/requests/extra_attributes.dart';
import 'package:persotrainer/models/requests/items.dart';
import 'package:persotrainer/models/requests/parties.dart';
import 'package:persotrainer/models/requests/schedule.dart';
import 'package:persotrainer/models/requests/transaction.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/services/escrow_service.dart';
import 'package:persotrainer/ui/views/cart_page.dart';
import 'package:persotrainer/ui/views/videocall_screen.dart';
import 'package:persotrainer/ui/widgets/persotrainer_messagebox.dart';
import 'package:provider/provider.dart';

class Message extends StatefulWidget {
  String chatRoomId;
  Message({this.chatRoomId});
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController messageController = TextEditingController();
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallScreen(
          channelName: 'MuhammadIbrahim',
          role: _role,
        ),
      ),
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(28.0),
                      bottomLeft: Radius.circular(28.0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(CupertinoIcons.chevron_back)),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Muhammad Ibrahim',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Last Seen: 12:00AM',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => onJoin(),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Icon(
                          CupertinoIcons.phone,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage(
                                      chatRoomId: widget.chatRoomId,
                                    )));
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Icon(
                          CupertinoIcons.cart,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: context
                          .read<DatabaseService>()
                          .getMessages(widget.chatRoomId),
                      builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
                        if (!snapshot.hasData) return Text("error");
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            reverse: true,
                            itemBuilder: (context, index) {
                              Chat chat = snapshot.data[index];
                              return PersoTrainerMessageBox(
                                isSendByMe: chat.sendBy == 'Muhammad Ibrahim',
                                message: chat.message,
                                time: chat.timestamp,
                              );
                            });
                      }),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.mic_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type Here...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (messageController.text.isEmpty) {
                              return null;
                            }
                            context.read<DatabaseService>().addMessage(
                                widget.chatRoomId,
                                Chat(
                                    timestamp: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    sendBy: 'Muhammad Ibrahim',
                                    message: messageController.text));
                            messageController.clear();
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            )),
                        isDense: true,
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(12.0),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
