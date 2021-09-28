import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Server {
  //static String address = "https://stmaryfa.msquare.app/";
  static String _apiToken;
  static String _loggedInUserType;
  static FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<String> get token async {
    if (_apiToken == null || _apiToken.isEmpty) {
      _apiToken = await _storage.read(key: "token");
    }
    return _apiToken;
  }

  static setToken(String token) async {
    _storage.write(key: "token", value: token);
  }

  static Future<int> get userType async {
    if (_loggedInUserType == null || _loggedInUserType.isEmpty) {
      _loggedInUserType = await _storage.read(key: "type");
    }
    return int.tryParse(_loggedInUserType);
  }

  static setUsertype(int type) async {
    _storage.write(key: "type", value: type.toString());
  }

  static logOut() async {
    _storage.delete(key: "token");
    _storage.delete(key: "type");
    _apiToken = null;
    _loggedInUserType = null;
  }
}


