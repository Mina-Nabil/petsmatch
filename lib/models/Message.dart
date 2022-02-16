import 'package:petmatch/providers/api_providers/api_url.dart';

class Message {
  String content;
  int senderid;
  String senderImg;
  String senderName;

  Message({this.content, this.senderImg, this.senderName, this.senderid});
  fromJson(Map<String, dynamic> json) {
    URLs _URLS = new URLs();
    String image;

    if (json["user"]['user']['image'] != null)
      image = _URLS.media + json["user"]['user']['image'];
    else
      image = "";
    this.content = json['content'];
    this.senderid = json["user"]['user']['id'];
    this.senderName = json["user"]['user']['name'];
    this.senderImg = image;

    return this;
  }
}
