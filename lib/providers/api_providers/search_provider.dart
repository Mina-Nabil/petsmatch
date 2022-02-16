import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'api_url.dart';

class SearchProvider extends ChangeNotifier {
  URLs _URLS = new URLs();

  List<Pet> _searchedPets;
  List<Pet> get searchedPets => _searchedPets;

  List<User> _searchedUsers;
  List<User> get searchedUsers => _searchedUsers;

  List<Post> _searchedPosts;
  List<Post> get searchedPosts => _searchedPosts;

  List<User> _searchedTrainers;
  List<User> get searchedTrainers => _searchedTrainers;

  Future<int> search({@required String searchContent}) async {
    print("start load <----");
    http.Response response;
    print("${_URLS.search}?content=${searchContent}");
    try {
      response =
          await http.get(Uri.parse("${_URLS.search}?content=${searchContent}"));
    } catch (_) {
      notifyListeners();
      return -1;
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      // List<dynamic> Postdata = jsonMap["Post"];
      // List<dynamic> Petdata = jsonMap["SubProfile"];
      List<dynamic> Userdata = jsonMap["User"];

      // Postdata.map((e) => e.image = _URLS.media + e.image);
      // _searchedPosts = Postdata.map((i) => RegularPost.fromJson(i)).toList();

      // Petdata.map((e) => e.image = _URLS.media + e.image);
      // _searchedPets = Petdata.map((i) => Pet.fromJson(i)).toList();

      Userdata.map((e) => e.image = _URLS.media + e.image);
      _searchedUsers = Userdata.map((i) => User.fromSearchJson(i)).toList();

      print(_searchedUsers);

      return response.statusCode;
    }
    print(response.statusCode);

    return -1;
  }

  Future<List<User>> searchSpecific(String type) async {
    print("start load <----");
    http.Response response;
    print("${_URLS.search}?type=${type}");
    try {
      response = await http.get(Uri.parse("${_URLS.search}?type=${type}"));
    } catch (_) {
      notifyListeners();
      return jsonDecode(response.body);
    }
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      List jsonList = jsonDecode(response.body);
      return jsonList.map((i) => User.fromSearchJson(i)).toList();
    }
    print(response.statusCode);

    return jsonDecode(response.body);
  }
}
