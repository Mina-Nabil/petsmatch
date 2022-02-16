import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;
import 'package:path/path.dart';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:petmatch/models/Pet.dart';
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
  List<Pet> _otherPets;
  Pet _selectedPet;

  List<Pet> get pets => _pets;
  List<Pet> get otherPets => _otherPets;
  Pet get selectedPet => _selectedPet;

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
      print('is the pet ID ${_pets[0].id}');
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

    response = await http.get(Uri.parse(_URLS.showOtherPets),
        headers: {'Authorization': 'Bearer $token'});

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      _otherPets = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return _otherPets;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }

  Future<int> addPet(Pet pet, String token) async {
    File imageFile = Io.File(pet.image);
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    String body;
    body = "?name=${pet.name}" + "&image=${pet.image}" + "&dob=${pet.dob}";
    var request =
        new http.MultipartRequest("POST", Uri.parse(_URLS.createPet + body));
    request.headers['Authorization'] = 'Bearer $token';
    var length = await imageFile.length();
    var multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();

    response.stream.transform(utf8.decoder).listen((value) {
      print('The value of the stream ${value}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("200 <----");
        Map<String, dynamic> decodedBody = jsonDecode(value);
        print(decodedBody);
        Pet decodedPet = Pet.fromJson(decodedBody);
        print(_pets);
        if (_pets == null) _pets = [];
        _pets.insert(0, decodedPet);
        print("done <----");
        return response.statusCode;
      }
    });
    print("Pet response <----");
    // If the call to the server was successful, parse the JSON.
    return response.statusCode;

    // If that call was not successful, throw an error.
    print("error");
    throw ("response state code ${response.statusCode}");
  }

  void setSelectedPet(Pet pet) {
    _selectedPet = pet;
    print(_selectedPet.name);
  }
}
