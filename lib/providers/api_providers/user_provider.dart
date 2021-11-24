import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/global.dart';
import 'api_url.dart';
import 'package:petmatch/models/User.dart';

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

  String _error = "";
  String get error => _error;

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

  Future<int> signUp(User user) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    String body;
    int type = 0;
    int gender = 0;
    if (user.usertype == "Pet Owner") type = 1;
    if (user.usertype == "Trainer") type = 2;
    if (user.usertype == "Vet") type = 3;
    if (user.usertype == "Store") type = 4;

    if (user.gender == "Male") gender = 1;
    body = "?name=${user.name}" +
        "&password=${user.password}" +
        "&email=${user.email}" +
        "&image=${user.image}" +
        "&gender=${gender}" +
        "&phone=${user.phone}" +
        "&dateOfBirth=${user.dateOfBirth}" +
        "&country=${user.country}" +
        "&city=${user.city}" +
        "&token=${user.token}" +
        "&usertype=${type}";
    var response;
    try {
      response = await http.post(
        Uri.parse(_URLS.register + body),
      );
      print("the respones is ${response}");
    } catch (_) {
      print("the error is ${_}");
      _loading = false;
      notifyListeners();
      return -1;
    }
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");

      _user = user;

      _isUserLoaded = true;
    } else {
      _error = "";
      Map<String, dynamic> decodedBody = jsonDecode(response.body);

      if (decodedBody.containsKey('name'))
        _error = _error + decodedBody['name'][0] + '\n';
      if (decodedBody.containsKey('email'))
        _error = _error + decodedBody['email'][0] + '\n';
      if (decodedBody.containsKey('country'))
        _error = _error + decodedBody['country'][0] + '\n';
      if (decodedBody.containsKey('city'))
        _error = _error + decodedBody['city'][0] + '\n';

      print(_error);
    }

    return response.statusCode;
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
