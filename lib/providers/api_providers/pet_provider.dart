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
    _pet = null;
  }

  bool _isLoaded;

  bool get isLoaded => _isLoaded;
  set isLoaded(bool isLoaded) {
    _isLoaded = isLoaded;
    notifyListeners();
  }

  List<Pet> _pet;
  List<Pet> get pet => _pet;

  URLs _URLS = new URLs();

  Future<int> getAPet(String petID, {@required String token}) async {
    print("start load <----");
    var response;
    String body =
        "?name=${pet.name}" + "&image=${pet.image}" + "&user_id=${pet.user_id}";
    try {
      response = await http.get(
        Uri.parse(_URLS.register + body),
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
      _pet = jsonList.map((i) => Pet.fromJson(i)).toList();
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

  Future<List<Pet>> showMyPets(String PetOwner,
      {@required String petID, @required String token}) async {
    print("start load <----");
    var response;
    String body = "?name=${_pet.name}" +
        "&image=${_pet.image}" +
        "&user_id=${_pet.user_id}";
    response = await http.get(
      Uri.parse(_URLS.register + body),
    );

    print("Pet response <----");
    print(response.body);
    // If the call to the server was successful, parse the JSON.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      // If the call to the server was successful, parse the JSON.
      print("200 <----");
      List jsonList = jsonDecode(response.body);
      List<Pet> _petCompanies = jsonList.map((i) => Pet.fromJson(i)).toList();
      print("done <----");
      return _petCompanies;
    } else {
      // If that call was not successful, throw an error.
      print("error");
      throw ("response state code ${response.statusCode}");
    }
  }

  // Future<int> createPet({Pet Pet, @required String token}) async {
  //   print("start load <----");
  //   var response;
  //   String body = "?name=${_pet.name}" +
  //       "&image=${_pet.image}" +
  //       "&user_id=${_pet.user_id}";
  //   try {
  //     response = await http.get(
  //       Uri.parse(_URLS.register + body),
  //     );
  //   } catch (_) {
  //     _isLoaded = false;
  //     notifyListeners();
  //     return -1;
  //   }
  //   print("respones <----");
  //   print(response.body);
  //   // If the call to the server was successful, parse the JSON.
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     // If the call to the server was successful, parse the JSON.
  //     Pet _newPet = Pet.fromJson(jsonDecode(response.body)[0]);
  //     _newPet.clear();
  //     _newPet.add(_newPet);
  //     notifyListeners();
  //     print("200 <----");
  //     print("done <----");
  //     return 1;
  //   } else {
  //     // If that call was not successful, throw an error.
  //     print("error");
  //     return 0;
  //   }
  // }
}
