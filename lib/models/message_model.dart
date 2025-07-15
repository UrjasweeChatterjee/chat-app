class MessageModel {
  final String senderId;
  final String receiverId;
  final String message;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      message: map['message'],
    );
  }
}
