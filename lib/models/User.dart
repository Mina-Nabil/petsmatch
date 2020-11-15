import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';

class User {
  String _name;
  String _email;
  String _image;

  List<Pet>  _pets = [];


  User(this._name, this._email, this._image);

  void addPet(Pet pet){
    _pets.add(pet);
  }

  void addAllPet(List<Pet> pets){
    _pets.addAll(pets);
  }

  String get name {
    return _name;
  }

  String get email {
    return _email;
  }

  String get image {
    return _image;
  }

  List<Pet> get pets {
    return _pets;
  }
}
