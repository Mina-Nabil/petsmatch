import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:petmatch/models/Pet.dart';
import '../../models/Pet.dart';
import 'package:http/http.dart' as http;
import 'api_url.dart';

class PetProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _isLoaded = null;
    _pets = null;
  }

  bool _isLoaded;

  bool get isLoaded => _isLoaded;
  set isLoaded(bool isLoaded) {
    _isLoaded = isLoaded;
    notifyListeners();
  }

  List<Pet> _pets;
  List<Pet> get pets => _pets;

  URLs _URLS = new URLs();

  Future<int> getAPet({@required String token}) async {
    print("start load <----");
    var response;
    try {
      response = await http.get(
        Uri.parse(_URLS.register),
      );
    } catch (_) {
      _isLoaded = false;
      notifyListeners();
      return -1;
    }
    print("Pet respones <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      // _pet = jsonList.map((i) => Pet.fromJson(i)).toList();
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

  Future<int> showMyPets({@required String token}) async {
    print("start load showMyPets <----");
    var response;

    response = await http.get(Uri.parse(_URLS.showMyPets),
        headers: {'Authorization': 'Bearer $token'});

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      if (_pets == null) _pets = [];
      _pets = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return response.statusCode;
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

  Future<int> addPet(Pet pet, String token) async {
    print("start load <----");
    var response;
    String body;
    body = "?name=${pet.name}" + "&image=${pet.image}" + "&dob=${pet.dob}";
    response = await http.post(Uri.parse(_URLS.createPet + body),
        headers: {'Authorization': 'Bearer $token'});

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      print(decodedBody);
      Pet decodedPet = Pet.fromJson(decodedBody);
      print(_pets);
      if (_pets == null) _pets = [];
      _pets.insert(0, decodedPet);
      print("done <----");
      return response.statusCode;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }
}
