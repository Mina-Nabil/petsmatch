import 'package:petmatch/models/Profile.dart';

class Vet extends Profile {

  Vet(name, imageURL){
    super.name = name;
    super.image = imageURL;
  }

  @override
  String whoIAm() {
    return this.name;
  }
}