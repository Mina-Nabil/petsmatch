// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import '../../models/Comment.dart';
// import 'api_url.dart';

// class CommentProvider extends ChangeNotifier {
//   //reset provider data
//   void reset() {
//     _isLoaded = null;
//     _Comment = [];
//   }

//   bool _isLoaded;
//   bool get isLoaded => _isLoaded;
//   set isLoaded(bool isLoaded) {
//     _isLoaded = isLoaded;
//     notifyListeners();
//   }

//   List<Comment> _Comment;
//   List<Comment> get Comment => _Comment;

//   URLs _URLS = new URLs();

//   Future<int> getComment(String postID, {@required String token}) async {
//     print("start load <----");
//     var response;
//     try {
//       response = await http.get(
//         _URLS.getComments + "?Comment_owner=$postID&token=$token",
//       );
//     } catch (_) {
//       _isLoaded = false;
//       notifyListeners();
//       return -1;
//     }
//     print("respones <----");
//     print(response.body);
//     // If the call to the server was successful, parse the JSON.
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       // If the call to the server was successful, parse the JSON.
//       print("200 <----");
//       List jsonList = jsonDecode(response.body);
//       _Comment = jsonList.map((i) => Comment.fromJson(i)).toList();
//       print("done <----");
//       _isLoaded = true;
//       notifyListeners();
//       return 1;
//     } else {
//       // If that call was not successful, throw an error.
//       print("error");
//       _isLoaded = false;
//       notifyListeners();
//       return 0;
//     }
//   }

//   Future<bool> addComment({Comment Comment, String token}) async {
//     print("start load <----");
//     var response;
//     try {
//       response = await http.post(_URLS.addComment, body: {
//         "id": Comment.id,
//         "owner": Comment.owner,
//         "post": Comment.post,
//         "text": Comment.text,
//         "postTime": Comment.postTime,
//         "lovers": Comment.lovers,
//         "replies": Comment.replies,
//       });
//     } catch (e) {
//       print(e);
//       notifyListeners();
//       return false;
//     }
//     print("respones <----");
//     print(response.body);
//     // If the call to the server was successful, parse the JSON.
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       // If the call to the server was successful, parse the JSON.
//       Comment _comment = Comment.fromNewJson(jsonDecode(response.body));
//       _Comment.insert(0, _Comment);
//       notifyListeners();
//       print("200 <----");
//       print("done <----");
//       return true;
//     } else {
//       // If that call was not successful, throw an error.
//       print("error");
//       return false;
//     }
//   }

//   Future<bool> editComment(
//       {Comment Comment, int itemIndex, String token}) async {
//     print("start load <----");
//     var response;
//     var body = {
//       "id": Comment.id,
//       "owner": Comment.owner,
//       "post": Comment.post,
//       "text": Comment.text,
//       "postTime": Comment.postTime,
//       "lovers": Comment.lovers,
//       "replies": Comment.replies,
//     };
//     if (Comment.image == null) {
//       body = {
//         "id": Comment.id,
//         "owner": Comment.owner,
//         "post": Comment.post,
//         "text": Comment.text,
//         "postTime": Comment.postTime,
//         "lovers": Comment.lovers,
//         "replies": Comment.replies,
//       };
//     }

//     try {
//       response = await http.post(URLs.editComment, body: body);
//     } catch (e) {
//       print(e);
//       notifyListeners();
//       return false;
//     }
//     print("respones <----");
//     print(response.body);
//     // If the call to the server was successful, parse the JSON.
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       // If the call to the server was successful, parse the JSON.
//       Comment _Comment = Comment.fromNewJson(jsonDecode(response.body));
//       _Comment[itemIndex] = _Comment;
//       notifyListeners();
//       print("200 <----");
//       print("done <----");
//       return true;
//     } else {
//       // If that call was not successful, throw an error.
//       print("error");
//       return false;
//     }
//   }
// }
