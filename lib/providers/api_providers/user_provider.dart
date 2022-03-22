import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/global.dart';
import 'package:petmatch/models/NotificationModel.dart';
import 'api_url.dart';
import 'package:petmatch/models/User.dart';
import 'package:async/async.dart';

class UserProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _user = null;
    _isUserLoaded = null;
    _loading = false;
  }

  Server s;
  User _user;
  User get user => _user;

  List<User> _follows;
  List<User> get follows => _follows;

  List<NotificationModel> _notifications;
  List<NotificationModel> get notifications => _notifications;

  String _error = "";
  String get error => _error;
  void setUser(user) {
    _user = user;
  }

  URLs _URLS = new URLs();

  bool _loading = false;
  bool get isLoaded => _loading;
  set isLoaded(bool isLoaded) {
    _loading = isLoaded;
    notifyListeners();
  }

  bool _isUserLoaded;
  bool get isUserLoaded => _isUserLoaded;
  set isUserLoaded(bool isLoaded) {
    _isUserLoaded = isLoaded;
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    String token = await Server.token;
    return token != null;
  }

  Future<int> me() async {
    notifyListeners();
    http.Response response;
    String token = await Server.token;
    try {
      response = await http.get(Uri.parse(_URLS.me), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (_) {
      // print(response.statusCode);
      print(_);
      _loading = false;
      notifyListeners();
      return 400;
    }
    if (response.statusCode > 300) return response.statusCode;

    Map<String, dynamic> decodedBody = jsonDecode(response.body);

    User loggedIn = User.fromJson(decodedBody);
    // Server.setToken(decodedBody["accessToken"]);
    print(loggedIn.name);
    _user = loggedIn;
    Server.setToken(_user.token);
    return response.statusCode;
    print(response.statusCode);
  }

  void updateFirebase(firebase_token) async {
    notifyListeners();
    http.Response response;
    String token = await Server.token;
    try {
      response = await http.post(Uri.parse(_URLS.me), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'firebase': firebase_token
      });
    } catch (_) {
      // print(response.statusCode);
      print(_);
      _loading = false;
      notifyListeners();
    }

    print(response);
  }

  Future<int> getNotifications() async {
    notifyListeners();
    http.Response response;
    String token = await Server.token;
    try {
      response = await http.get(Uri.parse(_URLS.notifications), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (_) {
      // print(response.statusCode);
      print(_);
      _loading = false;
      notifyListeners();
    }
    print(response.statusCode);

    List<dynamic> data = jsonDecode(response.body);
    _notifications = data.map((i) => NotificationModel.fromJson(i)).toList();

    return response.statusCode;
  }

  Future<int> getfollowers() async {
    notifyListeners();
    http.Response response;
    String token = await Server.token;
    try {
      response = await http.get(Uri.parse(_URLS.follow), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (_) {
      // print(response.statusCode);
      print(_);
      _loading = false;
      notifyListeners();
    }
    print(response.statusCode);

    List<dynamic> data = jsonDecode(response.body);
    _follows = data.map((i) => User.fromSearchJson(i)).toList();

    return response.statusCode;
  }

  void follow(int user_id) async {
    notifyListeners();
    http.Response response;
    String token = await Server.token;
    try {
      response = await http.post(Uri.parse(_URLS.follow), headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'user_id': user_id.toString()
      });
    } catch (_) {
      // print(response.statusCode);
      print(_);
      _loading = false;
      notifyListeners();
    }

    print(response);
  }

  Future<int> signUp(User user) async {
    print("start load <----");
    _loading = true;
    notifyListeners();

    int type = 0;
    int gender = 0;
    String body = "?name=${user.name}" +
        "&password=${user.password}" +
        "&email=${user.email}" +
        "&phone=${user.phone}" +
        "&dateOfBirth=${user.dateOfBirth}" +
        "&country=${user.country}" +
        "&city=${user.city}" +
        "&firebase_token=${user.firebase_token}";
    if (user.usertype == "Pet Owner") type = 1;
    if (user.usertype == "Trainer") {
      type = 2;
      body = body +
          "&orgainzation=${user.orgainzation}&about=${user.about}&experience=${user.experience}";
    }
    if (user.usertype == "Vet") type = 3;
    if (user.usertype == "Store") type = 4;

    if (user.gender == "Male") gender = 1;
    body = body + "&userType=${type}" + "&gender=${gender}";

    print(body);
    try {
      File imageFile = Io.File(user.image);
      var stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

      var request = new http.MultipartRequest(
        "POST",
        Uri.parse(_URLS.register + body),
      );
      var length = await imageFile.length();

      var multipartFile = new http.MultipartFile('image', stream, length,
          filename: basename(imageFile.path));
      request.files.add(multipartFile);
      var response = await request.send();
      print("statusCode ${response.statusCode}");
      response.stream.transform(utf8.decoder).listen((value) {
        print('The value of the stream ${value}');
        if (response.statusCode >= 200 && response.statusCode < 300) {
          var body = json.decode(value);
          _user = User.fromJson(body);
        } else {
          Map<String, dynamic> decodedBody = jsonDecode(value);

          if (decodedBody.containsKey('name'))
            _error = _error + decodedBody['name'][0] + '\n';
          if (decodedBody.containsKey('email'))
            _error = _error + decodedBody['email'][0] + '\n';
          if (decodedBody.containsKey('country'))
            _error = _error + decodedBody['country'][0] + '\n';
          if (decodedBody.containsKey('city'))
            _error = _error + decodedBody['city'][0] + '\n';
        }
      });

      // print(respStr);
      // If the call to the server was successful, parse the JSON.
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // If the call to the server was successful, parse the JSON.
        print("200 <----");

        _user = user;
        Server.setToken(_user.token);
        _isUserLoaded = true;
      } //else {
      //   _error = "";

      //   print(_error);
      // }

      return response.statusCode;
    } catch (_) {
      print("the error is ${_}");
      _loading = false;
      notifyListeners();
      return -1;
    }
  }

  Future<int> addPicture(User user) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    String body;
    body = "?password=${user.password}" + "&email=${user.email}";
    http.Response response;
    try {
      response = await http.post(Uri.parse(_URLS.login + body));
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }
    if (response.statusCode == 200) {
      //loggedin
      print(response.body);
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      User loggedIn = User.fromJson(decodedBody);
      // Server.setToken(decodedBody["accessToken"]);
      print(loggedIn.name);
      _user = loggedIn;
      print(_user);

      return response.statusCode;
    }
    print("response <----");
    print(response.body);
    print(response.statusCode);
    print(response.headers);
  }

  Future<int> login(User user) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    String body;
    body = "?password=${user.password}" +
        "&email=${user.email}" +
        "&firebase_token=${user.firebase_token}";
    print(body);
    http.Response response;
    try {
      response = await http.post(Uri.parse(_URLS.login + body));
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }
    if (response.statusCode == 200) {
      //loggedin
      print(response.body);
      Map<String, dynamic> decodedBody = jsonDecode(response.body);

      User loggedIn = User.fromJson(decodedBody);
      // Server.setToken(decodedBody["accessToken"]);
      print(loggedIn.name);
      _user = loggedIn;
      Server.setToken(_user.token);
      print(_user);

      return response.statusCode;
    }
    print("response <----");
    print(response.body);
    print(response.statusCode);
    print(response.headers);
  }

  Future<int> getUserData({
    @required String token,
  }) async {
    print("start load <----");
    var response;
    try {
      response = await http.post(Uri(scheme: URLs.getUser), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (error) {
      print(error);
      _isUserLoaded = false;
      notifyListeners();
      return -1;
    }
    print("Jobbers respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      _user = User.fromJson(jsonDecode(response.body));
      _isUserLoaded = true;
      notifyListeners();
      print("done <----");
      return 1;
    } else {
      print("error ${response.statusCode}");
      _isUserLoaded = false;
      notifyListeners();
      return 0;
    }
  }

  Future<int> updatePersonalInformation(User user) async {
    print(_user.token);
    print(_user.id);
    String body = "?name=${user.name}" +
        "&password=${user.password}" +
        "&email=${user.email}" +
        "&image=${user.image}" +
        "&gender=${user.gender}" +
        "&phone=${user.phone}" +
        "&dateOfBirth=${user.dateOfBirth}" +
        "&country=${user.country}" +
        "&city=${user.city}" +
        "&token=${user.token}" +
        "&type=${user.usertype}";
    if (user.password != null) {
      body += "&pass=${user.password}";
    }

    if (user.name != _user.name) {
      body += "&name=${user.name}";
    }
    print("start load <----");
    _loading = true;
    notifyListeners();
    var response;
    try {
      response = await http.get(Uri(scheme: _URLS.updateUserData + body));
    } catch (_) {
      return -1;
    }
    print("respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      _user = User.fromJson(json.decode(response.body));
      print("done <----");
      return 1;
    } else if (response.statusCode == 402) {
      print("name exist");
      return -2;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      return 0;
    }
  }

  Future<int> updateAreaOfInterest(User user) async {
    String body = "?name=${user.name}" +
        "&password=${user.password}" +
        "&email=${user.email}" +
        "&image=${user.image}" +
        "&gender=${user.gender}" +
        "&phone=${user.phone}" +
        "&dateOfBirth=${user.dateOfBirth}" +
        "&country=${user.country}" +
        "&city=${user.city}" +
        "&token=${user.token}" +
        "&type=${user.usertype}";
    print("start load <----");
    _loading = true;
    notifyListeners();
    var response;
    try {
      response = await http.get(Uri(scheme: _URLS.updateUserData + body));
    } catch (_) {
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

      _loading = false;
      notifyListeners();
      print("done <----");
      return 1;
    } else if (response.statusCode == 401) {
      _loading = false;
      notifyListeners();
      print("email exist");
      return -2;
    } else {
      // If that call was not successful, throw an error.
      _loading = false;
      notifyListeners();
      print("error");
      return 0;
    }
  }

  Future<int> updateSocialMediaLinks(User user) async {
    String body = "?name=${user.name}" +
        "&password=${user.password}" +
        "&email=${user.email}" +
        "&image=${user.image}" +
        "&gender=${user.gender}" +
        "&phone=${user.phone}" +
        "&dateOfBirth=${user.dateOfBirth}" +
        "&country=${user.country}" +
        "&city=${user.city}" +
        "&token=${user.token}" +
        "&type=${user.usertype}";
    print("start load <----");
    _loading = true;
    notifyListeners();
    var response;
    try {
      response = await http.get(Uri(scheme: _URLS.updateUserData + body));
    } catch (_) {
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
      _user = User.fromJson(json.decode(response.body));
      _loading = false;
      notifyListeners();
      print("done <----");
      return 1;
    } else if (response.statusCode == 401) {
      _loading = false;
      notifyListeners();
      print("email exist");
      return -2;
    } else {
      // If that call was not successful, throw an error.
      _loading = false;
      notifyListeners();
      print("error");
      return 0;
    }
  }

  Future<int> updateProfileImage(User user) async {
    print("start load <----");
    var response;
    try {
      response = await http.post(Uri(scheme: URLs.editProfileImage),
          body: {"uid": _user.id, "image": user.image, "token": _user.token});
    } catch (error) {
      print(error);
      return -1;
    }

    print("respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      _user.image = User.fromJson(json.decode(response.body)).image;
      notifyListeners();
      print("done <----");
      return 1;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      return 0;
    }
  }
}
