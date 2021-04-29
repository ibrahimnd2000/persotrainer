class Chat {
  final String timestamp;
  final String sendBy;
  final String message;

  Chat({this.timestamp, this.sendBy, this.message});

  Chat.fromJson(Map<String, dynamic> json)
      : timestamp = json['timestamp'],
        sendBy = json['sendBy'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'timestamp': timestamp,
        'sendBy': sendBy,
        'message': message,
      };
}
