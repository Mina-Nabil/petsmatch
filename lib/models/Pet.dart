import 'package:petmatch/models/Profile.dart';

class Pet extends Profile {
  String name;
  String image;
  int user_id;

  Pet({name = "", image = "", this.owner}) {
    super.name = name;
    super.image = image;
  }

  String whoIAm() {
    return "$owner's pet";
  }

  final String owner;
//  final String ownerId;

  factory Pet.fromJson(Map<String, dynamic> parsedJson) {
    return new Pet(
      name: parsedJson['name'],
      owner: parsedJson['uid'],
      image: parsedJson['image'],
    );
  }
}
