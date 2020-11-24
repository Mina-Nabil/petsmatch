import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Profile.dart';

class User extends Profile {
  String _email;

  List<Pet> _pets = [];

  User(
    name,
    image,
    this._email,
  ){
    super.name=name;
    super.image=image;
  }

  void addPet(Pet pet) {
    _pets.add(pet);
  }

  void addAllPet(List<Pet> pets) {
    _pets.addAll(pets);
  }

  String get name {
    return super.name;
  }

  String get email {
    return _email;
  }

  String get image {
    return super.image;
  }

  List<Pet> get pets {
    return _pets;
  }

  @override
  set image(String _image) {
    image = _image;
  }

  @override
  set name(String _name) {
    name = _name;
  }
}
