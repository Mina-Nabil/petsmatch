import 'package:petmatch/models/User.dart';
import 'package:petmatch/models/Post.dart';

class Comment {
  String id;
  User owner;
  Post post;
  String text;
  DateTime postTime;
  List<User> lovers = [];
  List<Comment> replies;

  Comment(
      {this.id,
      this.text = "",
      this.owner,
      this.postTime,
      this.lovers,
      this.replies});

  factory Comment.fromJson(Map<String, dynamic> parsedJson) {
    return Comment(
      id: parsedJson["id"],
      owner: parsedJson["user_id"].toDouble() ?? 1.0.toDouble(),
      postTime: parsedJson["created_at"],
      text: parsedJson["content"],
    );
  }
}
