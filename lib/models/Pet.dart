
import 'package:petmatch/models/Profile.dart';

class Pet extends Profile{


  Pet(name, image, this.owner){
    super.name = name;
    super.image=image;
  }

  String get name {
    return super.name;
  }

  String get image {
    return super.image;
  }

  @override
  set name(String _name) {
   name=_name;
  }

  @override
  set image(String _image) {
      image=_image;
  }

  String whoIAm() {
    return "$owner's pet";
  }

  final String owner;
//  final String ownerId;
}
