import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';


class UserNameRole extends StatelessWidget {
  UserNameRole({
    @required this.name,
    @required this.role,
  });
  final String name;
  final String role;
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: PetsTheme.getMeduimFont() ,fontWeight: FontWeight.bold),),
          Text(role,style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: Colors.grey)),
        ],
      );
  }
}