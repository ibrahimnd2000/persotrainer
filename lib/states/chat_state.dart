import 'package:flutter/material.dart';
import 'package:persotrainer/models/chatRoom.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/ui/views/message.dart';
import 'package:provider/provider.dart';

class ChatState {
  sendMessage(BuildContext context, String myName, String userName) {
    List<String> users = [myName, userName];

    String chatRoomId = getChatId(myName, userName);

    Map<String, dynamic> data =
        ChatRoom(chatRoomId: chatRoomId, users: users).toJson();

    Provider.of<DatabaseService>(context, listen: false)
        .addChatRoom(chatRoomId, data);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Message(
                  chatRoomId: chatRoomId,
                )));
  }

  getChatId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
