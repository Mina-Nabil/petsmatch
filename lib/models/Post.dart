import 'package:petmatch/models/Comment.dart';
import 'package:petmatch/models/User.dart';

abstract class Post {
  User owner;
  List<Comment> comments;
  List<User> lovers;
  List<Post> shares;
  DateTime postDate;
}
