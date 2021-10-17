import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:petmatch/models/Pet.dart';
import '../../models/Chat.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';

class ChatProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _isLoaded = null;
  }

  bool _isLoaded;

  bool get isLoaded => _isLoaded;
  set isLoaded(bool isLoaded) {
    _isLoaded = isLoaded;
    notifyListeners();
  }

  List<Chat> _chat;
  List<Chat> get chat => _chat;

  URLs _URLS = new URLs();

  Future<int> getChats({@required String token}) async {
    print("start load <----");
    var response;
    try {
      response = await http.get(Uri.parse(_URLS.register), headers: {
        'Authorization': 'Bearer $token',
      });
    } catch (_) {
      _isLoaded = false;
      notifyListeners();
      return -1;
    }
    print("Chat respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      _chat = jsonList.map((i) => Chat.fromJson(i)).toList();
      print("done <----");
      _isLoaded = true;
      notifyListeners();
      return 1;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      _isLoaded = false;
      notifyListeners();
      return 0;
    }
  }

  Future<List<Pet>> showMyPets({@required String token}) async {
    print("start load <----");
    var response;

    response = await http.get(
      Uri.parse(_URLS.register),
    );

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      List<Pet> _pets = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return _pets;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }

  Future<List<Pet>> showOtherPets({@required String token}) async {
    print("start load <----");
    var response;

    response = await http.get(
      Uri.parse(_URLS.showOtherPets),
    );

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      List<Pet> _pets = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return _pets;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }

  Future<List<Pet>> addPet(Pet pet, {@required String token}) async {
    print("start load <----");
    var response;
    String body;
    body = "?name=${pet.name}" + "&image=${pet.image}" + "&dob=${pet.dob}";
    response = await http.post(
      Uri.parse(_URLS.register + body),
    );

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      List<Pet> _pets = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return _pets;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }
}
