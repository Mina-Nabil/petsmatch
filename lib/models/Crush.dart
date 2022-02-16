import 'package:petmatch/models/Pet.dart';

class Crush {
  Pet crush_from;
  Pet crush_on;

  Crush({
    crush_on = null,
    crush_from = null,
  }) {
    this.crush_on = crush_on;
    this.crush_from = crush_from;
  }

  factory Crush.fromJson(Map<String, dynamic> parsedJson) {
    print('the id is ${parsedJson['id']}');
    Pet crushOn = Pet.fromJson(parsedJson['crush_by']);
    Pet crushFrom = Pet.fromJson(parsedJson['crush_on']);

    return new Crush(
      crush_from: crushFrom,
      crush_on: crushOn,
    );
  }
}
