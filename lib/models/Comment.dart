import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';

class Comment {
  User owner;
  String text;
  DateTime postTime;
  List<User> lovers = [];
  List<Comment> replies;

 }