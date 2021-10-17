import 'package:flutter/material.dart';
import 'User.dart';

class Chat {
  Chat({this.user, this.lastText, this.dateTime});
  User user;
  String lastText;
  DateTime dateTime;

  factory Chat.fromJson(Map<String, dynamic> parsedJson) {
    return new Chat(
      user: parsedJson['sender_user']['name'],
      lastText: parsedJson['latest_message']['content'],
      dateTime: parsedJson['updated_at'],
    );
  }
}
