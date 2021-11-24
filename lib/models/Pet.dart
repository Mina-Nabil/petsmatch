import 'package:petmatch/models/Profile.dart';

class Pet extends Profile {
  DateTime dob;
  int user_id;

  Pet({
    name = "",
    image = "",
    this.owner,
    dob = null,
  }) {
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
      owner: parsedJson['user_id'].toString(),
      image: parsedJson['image'],
    );
  }
}
