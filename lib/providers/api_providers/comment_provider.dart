import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'api_url.dart';

class CommentProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _isLoaded = null;
    _comments = [];
  }

  bool _isLoaded;
  bool get isLoaded => _isLoaded;
  set isLoaded(bool isLoaded) {
    _isLoaded = isLoaded;
    notifyListeners();
  }

  List<Comment> _comments;
  List<Comment> get comments => _comments;

  void addCommentToList(Comment comment) {
    _comments.add(comment);
  }

  URLs _URLS = new URLs();

  Future<int> getComment({@required String postID}) async {
    print("start load <----");
    var response;
    print(_URLS.getPostComments + "?post_id=$postID");
    try {
      response = await http.get(
        Uri.parse(_URLS.getPostComments + "?post_id=$postID"),
      );
    } catch (_) {
      _isLoaded = false;
      notifyListeners();
      return -1;
    }
    print("respones <----");
    // print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      _comments = jsonList.map((i) => Comment.fromJson(i)).toList();
      print(_comments);
      _isLoaded = true;
      notifyListeners();
      return response.statusCode;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      _isLoaded = false;
      notifyListeners();
      return response.statusCode;
    }
  }

  Future<bool> addComment(String comment, String postID, String token) async {
    print("start load <----");
    print(Uri.parse(_URLS.createComment));

    var response;
    try {
      response = await http.post(Uri.parse(_URLS.createComment),
          body: {"post_id": postID, "content": comment},
          headers: {'Authorization': 'Bearer $token'});
    } catch (e) {
      print(e);
      notifyListeners();
      return false;
    }
    print("respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.

      notifyListeners();
      print("200 <----");
      print("done <----");
      return true;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      return false;
    }
  }

  // Future<bool> editComment(
  //     {Comment Comment, int itemIndex, String token}) async {
  //   print("start load <----");
  //   var response;
  //   var body = {
  //     "id": Comment.id,
  //     "owner": Comment.owner,
  //     "post": Comment.post,
  //     "text": Comment.text,
  //     "postTime": Comment.postTime,
  //     "lovers": Comment.lovers,
  //     "replies": Comment.replies,
  //   };
  //   if (Comment.image == null) {
  //     body = {
  //       "id": Comment.id,
  //       "owner": Comment.owner,
  //       "post": Comment.post,
  //       "text": Comment.text,
  //       "postTime": Comment.postTime,
  //       "lovers": Comment.lovers,
  //       "replies": Comment.replies,
  //     };
  //   }

  //   try {
  //     response = await http.post(URLs.editComment, body: body);
  //   } catch (e) {
  //     print(e);
  //     notifyListeners();
  //     return false;
  //   }
  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     Comment _Comment = Comment.fromNewJson(jsonDecode(response.body));
  //     _Comment[itemIndex] = _Comment;
  //     notifyListeners();
  //     print("200 <----");
  //     print("done <----");
  //     return true;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     print("error");
  //     return false;
  //   }
  // }
}
