import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Profile.dart';

class User extends Profile {
  String _email;

  List<Pet> _pets = [];

  User(
    name,
    image,
    this._email,
    {
      List<Pet> pets,
    }
  ){
    super.name=name;
    super.image=image;
    if(pets != null)
      _pets = pets;
  }

  String whoIAm() {
    if(pets.length == 0)
      return "";
      
    String role = "Owner of ";
    for (var pet in _pets) {
      role += pet.name + ", ";
    }
    return role.substring(0, role.length - 2); /*substring to remove last 2 chars ", " , i know it is not the best way :P*/
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
