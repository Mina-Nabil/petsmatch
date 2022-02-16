import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/models/Mate.dart';
import 'api_url.dart';
import '../../models/pet.dart';

class MateProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _loading = false;
  }

  List<Mate> _mates;
  List<Mate> get mates => _mates;

  URLs _URLS = new URLs();

  bool _loading = false;
  bool get isLoaded => _loading;
  set isLoaded(bool isLoaded) {
    _loading = isLoaded;
    notifyListeners();
  }

  Future<int> createmate(Pet petOne, Pet petTwo, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    print('${petOne.id} is subprofile_id');
    String body;
    body = "?subprofile_id=${petOne.id}" + "&my_subprofile_id=${petTwo.id}";
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

  Future<int> getmates(String token, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    try {
      response = await http.get(
          Uri.parse(
            _URLS.mate,
          ),
          headers: {'Authorization': 'Bearer $token'});
    } catch (_) {
      print(_);
      _loading = false;
      notifyListeners();
      return -1;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> data = jsonDecode(response.body)[0];
      _mates = data.map((i) => Mate.fromJson(i)).toList();
      print(_mates);

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
