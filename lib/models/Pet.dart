import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/providers/api_providers/api_url.dart';

class Pet extends Profile {
  DateTime dob;
  int user_id;

  Pet({
    id = "",
    name = "",
    image = "",
    this.owner,
    dob = null,
  }) {
    super.id = id;
    super.name = name;
    super.image = image;
  }

  String whoIAm() {
    return "$owner's pet";
  }

  final String owner;
//  final String ownerId;

  factory Pet.fromJson(Map<String, dynamic> parsedJson) {
    print('the id is ${parsedJson['id']}');
    URLs _URLS = new URLs();
    String image = _URLS.media + parsedJson['image'];

    return new Pet(
      id: parsedJson['id'],
      name: parsedJson['name'],
      owner: parsedJson['owner']['name'].toString(),
      image: image,
    );
  }
}
