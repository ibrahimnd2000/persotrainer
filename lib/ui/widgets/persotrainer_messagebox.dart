import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:intl/intl.dart';

class PersoTrainerMessageBox extends StatefulWidget {
  bool isSendByMe;
  String message, time;
  PersoTrainerMessageBox(
      {this.isSendByMe = true, this.message = '', this.time = ''});
  @override
  _PersoTrainerMessageBoxState createState() => _PersoTrainerMessageBoxState();
}

class _PersoTrainerMessageBoxState extends State<PersoTrainerMessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 30,
            child: Visibility(
                visible: widget.isSendByMe,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    DateFormat('hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            int.parse(widget.time))),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                )),
          ),
          ChatBubble(
            clipper: ChatBubbleClipper3(
                type: widget.isSendByMe
                    ? BubbleType.sendBubble
                    : BubbleType.receiverBubble),
            alignment:
                widget.isSendByMe ? Alignment.topRight : Alignment.topLeft,
            margin: EdgeInsets.only(top: 20),
            elevation: 1.5,
            backGroundColor:
                widget.isSendByMe ? Color(0xFF50CB87) : Colors.white,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                "${widget.message}",
                style: TextStyle(
                    color: widget.isSendByMe ? Colors.white : Colors.black),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 30,
            child: Visibility(
                visible: !widget.isSendByMe,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    DateFormat('hh:mm a').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            int.parse(widget.time))),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
