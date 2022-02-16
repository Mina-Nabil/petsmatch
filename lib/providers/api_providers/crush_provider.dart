import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/models/Crush.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:provider/provider.dart';
import 'api_url.dart';

class CrushProvider extends ChangeNotifier {
  //reset provider data
  void reset() {
    _loading = false;
  }

  PetProvider petProvider;
  Pet _pet;
  Pet get pet => _pet;

  List<Crush> _crushes;
  List<Crush> get crushes => _crushes;

  URLs _URLS = new URLs();

  bool _loading = false;
  bool get isLoaded => _loading;
  set isLoaded(bool isLoaded) {
    _loading = isLoaded;
    notifyListeners();
  }

  Future<int> createCrush(Pet pet, BuildContext context) async {
    petProvider = Provider.of<PetProvider>(context, listen: false);

    print("start load <----");
    _loading = true;
    notifyListeners();
    print('${pet.id} is subprofile_id');
    print('${petProvider.selectedPet.id} is my_subprofile_id');
    String body;
    body = "?subprofile_id=${pet.id}" +
        "&my_subprofile_id=${petProvider.selectedPet.id}";
    var response;
    try {
      response = await http.post(Uri.parse(
        _URLS.crush + body,
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

  Future<int> getCrushes(String token, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    try {
      response = await http.get(
          Uri.parse(
            _URLS.myCrush,
          ),
          headers: {'Authorization': 'Bearer $token'});
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

  Future<int> getCrushOnMe(String token, BuildContext context) async {
    print("start load <----");
    _loading = true;
    notifyListeners();
    http.Response response;
    try {
      response = await http.get(
          Uri.parse(
            _URLS.myCrush,
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
      _crushes = data.map((i) => Crush.fromJson(i)).toList();
      print(_crushes);

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
    print("Crush respones <----");
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
