import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/models/Comment.dart';
import 'api_url.dart';
import '../../models/Post.dart';

class PostProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _post = null;
    _ispostLoaded = null;
    _loading = false;
  }

  Post _post;
  Post get post => _post;
  List<Comment> _comments;
  List<Comment> get comments => _comments;

  List<RegularPost> _posts;

  List<RegularPost> get posts => _posts;

  URLs _URLS = new URLs();

  bool _loading = false;
  bool get isLoaded => _loading;
  set isLoaded(bool isLoaded) {
    _loading = isLoaded;
    notifyListeners();
  }

  bool _ispostLoaded;
  bool get ispostLoaded => _ispostLoaded;
  set ispostLoaded(bool isLoaded) {
    _ispostLoaded = isLoaded;
    notifyListeners();
  }

// @required this.owner,
//     @required this.postDate,
//     @required this.commentsCount,
//     @required this.sharesCount,
//     @required this.lovesCount,
//     @required isLoved,
  Future<int> getNewsFeed(String token) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    print("this is the token ${token}");
    try {
      response = await http.get(Uri.parse(_URLS.getNewsFeed), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }
    print("respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");

      print(json.decode(response.body));
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      List<dynamic> data = jsonMap["data"];
      print('${data} this is the data');
      data.map((e) => e.image = _URLS.media + e.image);
      _posts = data.map((i) => RegularPost.fromJson(i)).toList();

      return response.statusCode;
      // List<string> = json.decode()
      // _post = RegularPost.fromJson(json.decode(response.body));

      _ispostLoaded = true;
    }
  }

  Future<int> createPost(RegularPost post, String token) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    var map = new Map<String, dynamic>();
    map['content'] = post.text;
    map['image'] = post.image;
    try {
      response = await http.post(Uri.parse(_URLS.createPost),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: map);
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }

    print("response <----");
    print(response.body);
    print(response.statusCode);
    print(response.headers);
  }

  void setPost(RegularPost post) {
    _post = post;
    print(_post);
  }

  void setComment(RegularPost post) {
    _post = post;
    print(_post);
  }

  Future<int> createComment(String text, String post_id, String token) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    var map = new Map<String, dynamic>();
    map['content'] = text;
    map['post_id'] = post_id;
    try {
      response = await http.post(Uri.parse(_URLS.createComment),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: map);
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }

    print("response <----");
    print(response.body);
    print(response.statusCode);
    print(response.headers);
  }

  // Future<int> getpostData({
  //   @required String token,
  // }) async {
  //   print("start load <----");
  //   http.Response response;
  //   try {
  //     response = await http.get(
  //       URLs.getpost + '&token=$token',
  //     );
  //   } catch (error) {
  //     print(error);
  //     _ispostLoaded = false;
  //     notifyListeners();
  //     return -1;
  //   }
  //   print("Jobbers respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     print("200 <----");
  //     _post = post.fromJson(jsonDecode(response.body));
  //     _ispostLoaded = true;
  //     notifyListeners();
  //     print("done <----");
  //     return 1;
  //   } else {
  //     print("error ${response.statusCode}");
  //     _ispostLoaded = false;
  //     notifyListeners();
  //     return 0;
  //   }
  // }

  // Future<int> updatePersonalInformation(post post) async {
  //   print(_post.token);
  //   print(_post.id);
  //   String body = "?name=${post.name}" +
  //       "&password=${post.password}" +
  //       "&email=${post.email}" +
  //       "&image=${post.image}" +
  //       "&gender=${post.gender}" +
  //       "&phone=${post.phone}" +
  //       "&dateOfBirth=${post.dateOfBirth}" +
  //       "&country=${post.country}" +
  //       "&city=${post.city}" +
  //       "&token=${post.token}" +
  //       "&type=${post.posttype}";
  //   if (post.password != null) {
  //     body += "&pass=${post.password}";
  //   }

  //   if (post.name != _post.name) {
  //     body += "&name=${post.name}";
  //   }
  //   print("start load <----");
  //   _loading = true;
  //   notifyListeners();
  //   var response;
  //   try {
  //     response = await http.get(_URLS.updatepostData + body);
  //   } catch (_) {
  //     return -1;
  //   }
  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     print("200 <----");
  //     _post = post.fromJson(json.decode(response.body));
  //     print("done <----");
  //     return 1;
  //   } else if (response.statusCode == 402) {
  //     print("name exist");
  //     return -2;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     print("error");
  //     return 0;
  //   }
  // }

  // Future<int> updateAreaOfInterest(post post) async {
  //   String body = "?name=${post.name}" +
  //       "&password=${post.password}" +
  //       "&email=${post.email}" +
  //       "&image=${post.image}" +
  //       "&gender=${post.gender}" +
  //       "&phone=${post.phone}" +
  //       "&dateOfBirth=${post.dateOfBirth}" +
  //       "&country=${post.country}" +
  //       "&city=${post.city}" +
  //       "&token=${post.token}" +
  //       "&type=${post.posttype}";
  //   print("start load <----");
  //   _loading = true;
  //   notifyListeners();
  //   var response;
  //   try {
  //     response = await http.get(_URLS.updatepostData + body);
  //   } catch (_) {
  //     _loading = false;
  //     notifyListeners();
  //     return -1;
  //   }
  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     print("200 <----");

  //     _loading = false;
  //     notifyListeners();
  //     print("done <----");
  //     return 1;
  //   } else if (response.statusCode == 401) {
  //     _loading = false;
  //     notifyListeners();
  //     print("email exist");
  //     return -2;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     _loading = false;
  //     notifyListeners();
  //     print("error");
  //     return 0;
  //   }
  // }

  // Future<int> updateSocialMediaLinks(post post) async {
  //   String body = "?name=${post.name}" +
  //       "&password=${post.password}" +
  //       "&email=${post.email}" +
  //       "&image=${post.image}" +
  //       "&gender=${post.gender}" +
  //       "&phone=${post.phone}" +
  //       "&dateOfBirth=${post.dateOfBirth}" +
  //       "&country=${post.country}" +
  //       "&city=${post.city}" +
  //       "&token=${post.token}" +
  //       "&type=${post.posttype}";
  //   print("start load <----");
  //   _loading = true;
  //   notifyListeners();
  //   var response;
  //   try {
  //     response = await http.get(_URLS.updatepostData + body);
  //   } catch (_) {
  //     _loading = false;
  //     notifyListeners();
  //     return -1;
  //   }
  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     print("200 <----");
  //     _post = post.fromJson(json.decode(response.body));
  //     _loading = false;
  //     notifyListeners();
  //     print("done <----");
  //     return 1;
  //   } else if (response.statusCode == 401) {
  //     _loading = false;
  //     notifyListeners();
  //     print("email exist");
  //     return -2;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     _loading = false;
  //     notifyListeners();
  //     print("error");
  //     return 0;
  //   }
  // }

  // Future<int> updateProfileImage(post post) async {
  //   print("start load <----");
  //   var response;
  //   try {
  //     response = await http.post(URLs.editProfileImage,
  //         body: {"uid": _post.id, "image": post.image, "token": _post.token});
  //   } catch (error) {
  //     print(error);
  //     return -1;
  //   }

  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     print("200 <----");
  //     _post.image = post.fromJson(json.decode(response.body)).image;
  //     notifyListeners();
  //     print("done <----");
  //     return 1;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     print("error");
  //     return 0;
  //   }
  // }
}
