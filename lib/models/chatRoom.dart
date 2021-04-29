class ChatRoom {
  final String chatRoomId;
  final List<dynamic> users;

  ChatRoom({this.chatRoomId, this.users});

  ChatRoom.fromJson(Map<String, dynamic> json)
      : chatRoomId = json['chatRoomId'],
        users = json['users'];

  Map<String, dynamic> toJson() => {
        'chatRoomId': chatRoomId,
        'users': users,
      };
}
