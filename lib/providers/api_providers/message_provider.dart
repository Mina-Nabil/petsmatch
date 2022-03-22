import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:petmatch/models/Chat.dart';
import 'package:petmatch/models/Message.dart';
import 'package:petmatch/providers/api_providers/api_url.dart';

class MessagesProvider extends ChangeNotifier {
  List<Message> _messages = [];
  Chat _selectedChat;
  List<Chat> chats = [];
  reset() {
    _messages = [];
    notifyListeners();
  }

  List<Message> get messages => _messages;
  Chat get selectedChat => _selectedChat;

  void setSelectedChat(Chat selectedChat) {
    _selectedChat = selectedChat;
    print(_selectedChat.senderName);
  }

  Future<int> getChat(token, user_id) async {
    Response response;
    var temp;
    _messages = [];
    notifyListeners();

    try {
      print("uri ${URLs.getChat + "?user_id=$user_id"}");
      response = await get(Uri.parse(URLs.getChat + "?user_id=$user_id"),
          headers: {'Authorization': 'Bearer $token'});
      print("sttsscode ${response.statusCode}");
      print(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        temp = jsonDecode(response.body)["messages"];
        print('this is the message body ${temp}');
        for (int i = 0; i < temp.length; i++) {
          Message message = Message();
          _messages.add(message.fromJson(temp[i]));
          notifyListeners();
        }
      }
      return response.statusCode;
    } catch (e) {
      print(e.toString());
      return -1;
    }
  }

  Future<int> getAllChats(token) async {
    Response response;
    List temp = [];
    chats = [];
    notifyListeners();
    try {
      response = await get(Uri.parse(URLs.getMyChats),
          headers: {'Authorization': 'Bearer $token'});
      print("sttsscode ${response.statusCode}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // client's request was successfully received
        temp = jsonDecode(response.body);
        print(response.body);
        print("Teemp leength is ${temp.length}");
        for (int i = 0; i < temp.length; i++) {
          Chat newchat = Chat();
          chats.add(newchat.fromJson(temp[i]));
          notifyListeners();
        }
        return response.statusCode;
      } else {
        return -1;
      }
    } catch (e) {
      print(e.toString());
      return -1;
    }
  }

  Future<int> sendMessage(user_id, message, token) async {
    Response response;
    try {
      print(user_id);
      response = await post(
          Uri.parse(URLs.sendMessage + "?user_id=$user_id&message=$message"),
          headers: {'Authorization': 'Bearer $token'});
      print("${URLs.sendMessage + "?user_id=$user_id&message=$message"}");
      print("sttsscode ${response.statusCode}");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.statusCode;
      } else {
        print(response.body);
        return -1;
      }
    } catch (e) {
      print(e.toString());
      return -1;
    }
  }

  refresh() {
    notifyListeners();
  }
}
