import 'package:petmatch/models/Pet.dart';

class Mate {
  Pet mate_from;
  Pet mate_on;

  Mate({
    mate_on = null,
    mate_from = null,
  }) {
    this.mate_on = mate_on;
    this.mate_from = mate_from;
  }

  factory Mate.fromJson(Map<String, dynamic> parsedJson) {
    print('the id is ${parsedJson['id']}');
    Pet mateOn = Pet.fromJson(parsedJson['mate_one']);
    Pet mateFrom = Pet.fromJson(parsedJson['mate_two']);

    return new Mate(
      mate_from: mateFrom,
      mate_on: mateOn,
    );
  }
}
