import 'package:intl/intl.dart';

class Chat {
  String senderName;
  int senderId;
  String senderImage;
  String senderRole;
  DateTime date;
  List senderMessage;

  // Chat(this.senderName, this.senderId, this.senderImage, this.senderMessage);
  fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    this.senderName = json['participant']["user"]["name"];
    senderId = json['participant']["user"]["id"];
    senderImage = json['participant']["user"]["image"];
    senderRole = json['participant']["user"]["usertype_id"];
    senderMessage = json["messages"];
    date = dateFormat.parse(json['created_at']);
    return this;
  }
}
