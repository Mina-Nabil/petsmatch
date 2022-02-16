import 'package:intl/intl.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/providers/api_providers/api_url.dart';

class User extends Profile {
  String name;
  String image;
  String email;
  String phone;
  String gender;
  DateTime dateOfBirth;
  String country;
  String city;
  String token;
  String password;
  String firebase_token;
  String usertype;
  String about;
  String orgainzation;
  int experience;

  List<Pet> pets = [];

  User({
    id,
    this.name,
    this.image,
    this.email,
    this.gender,
    this.phone,
    this.dateOfBirth,
    this.country,
    this.city,
    this.token,
    this.password,
    this.firebase_token,
    this.usertype,
    this.about,
    this.orgainzation,
    this.experience,
    List<Pet> pets,
  }) {
    super.id = id;
    super.name = name;
    super.image = image;
    if (pets != null) pets = pets;
  }

  String whoIAm() {
    if (pets.length == 0) return "";

    String role = "Owner of ";
    for (var pet in pets) {
      role += pet.name + ", ";
    }
    return role.substring(
        0,
        role.length -
            2); /*substring to remove last 2 chars ", " , i know it is not the best way :P*/
  }

  void addPet(Pet pet) {
    pets.add(pet);
  }

  void addAllPet(List<Pet> pets) {
    print(pets);
    this.pets.addAll(pets);
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    String gender = "Female";
    if (parsedJson['gender'] == 1) gender = "Male";
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    URLs _URLS = new URLs();
    String image;
    if (parsedJson['image'] != null)
      image = _URLS.media + parsedJson['image'];
    else
      image = "";
    return new User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      image: image,
      email: parsedJson['email'],
      gender: gender,
      phone: parsedJson['phone'],
      dateOfBirth: dateFormat.parse(parsedJson['dateOfBirth']),
      country: parsedJson['country'],
      city: parsedJson['city'],
      firebase_token: parsedJson['firebase_token'],
      about: parsedJson['about'],
      orgainzation: parsedJson['orgainzation'],
      experience: parsedJson['experience'] == ""
          ? 0
          : int.parse(parsedJson['experience']),
      token: parsedJson['token']['plainTextToken'],
      usertype: parsedJson['user_type'] == null
          ? "0"
          : parsedJson['user_type']['id'].toString(),
      // password: parsedJson['password'],
      // usertype: parsedJson['usertype'],
    );
  }
  factory User.fromSearchJson(Map<String, dynamic> parsedJson) {
    // print("this is the parsed jSON in User  ${parsedJson}");
    String gender = "Female";
    if (parsedJson['gender'] == "1") gender = "Male";
    URLs _URLS = new URLs();
    String image;
    if (parsedJson['image'] != null)
      image = _URLS.media + parsedJson['image'];
    else
      image = "";
    return new User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      image: image,
      email: parsedJson['email'],
      gender: gender,
      phone: parsedJson['phone'],
      // dateOfBirth: dateFormat.parse(parsedJson['dateOfBirth']),
      country: parsedJson['country'],
      city: parsedJson['city'],
      // token: parsedJson['plainTextToken'],
      // password: parsedJson['password'],q
      // usertype: parsedJson['usertype'],
    );
  }
}
