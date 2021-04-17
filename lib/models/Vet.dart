import 'package:petmatch/models/Profile.dart';

class Vet extends Profile {

  Vet(name, imageURL, rating){
    super.name = name;
    super.image = imageURL;
    super.rating = rating;
  }

  @override
  String whoIAm() {
    return this.name;
  }
}