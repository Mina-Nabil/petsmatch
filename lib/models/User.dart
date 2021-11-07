import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Profile.dart';

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
  String usertype;

  List<Pet> pets = [];

  User({
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
    this.usertype,
    List<Pet> pets,
  }) {
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
    pets.addAll(pets);
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return new User(
      name: parsedJson['name'],
      image: parsedJson['image'],
      email: parsedJson['email'],
      gender: parsedJson['gender'],
      phone: parsedJson['phone'],
      dateOfBirth: parsedJson['dateOfBirth'],
      country: parsedJson['country'],
      city: parsedJson['city'],
      token: parsedJson['token'],
      password: parsedJson['password'],
      usertype: parsedJson['usertype'],
    );
  }
}
