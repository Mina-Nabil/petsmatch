import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';
import '../../models/pet.dart';

class UserProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _loading = false;
  }

  Pet _pet;
  Pet get pet => _pet;

  URLs _URLS = new URLs();

  bool _loading = false;
  bool get isLoaded => _loading;
  set isLoaded(bool isLoaded) {
    _loading = isLoaded;
    notifyListeners();
  }

  Future<int> createmate(Pet pet, Pet myPet, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    String body;
    body = "?subprofile_id=${pet.id}" + "&my_subprofile_id=${myPet.id}";
    var response;
    try {
      response = await http.post(Uri.parse(
        _URLS.mate + body,
      ));
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }
    print("respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
  }

  Future<int> getmates(Pet myPet, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    try {
      response = await http.get(Uri.parse(
        _URLS.mate,
      ));
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

  Future<int> getUserData({
    @required String token,
  }) async {
    print("start load <----");
    http.Response response;
    try {
      response = await http.get(Uri.parse(
        URLs.getUser + '&token=$token',
      ));
    } catch (error) {
      print(error);
      notifyListeners();
      return -1;
    }
    print("mate respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      notifyListeners();
      print("done <----");
      return 1;
    } else {
      print("error ${response.statusCode}");
      notifyListeners();
      return 0;
    }
  }
}
