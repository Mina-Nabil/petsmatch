import 'package:intl/intl.dart';

class NotificationModel {
  NotificationModel({this.imageurl, this.text, this.datetime});
  final String imageurl;
  final String text;
  final DateTime datetime;

  factory NotificationModel.fromJson(Map<String, dynamic> parsedJson) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");

    return new NotificationModel(
      imageurl: parsedJson['content'],
      text: parsedJson['content'],
      datetime: dateFormat.parse(parsedJson['created_at']),
    );
  }
}
