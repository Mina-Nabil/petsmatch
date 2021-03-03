import 'package:flutter/material.dart';
import 'package:petmatch/ui/profile/widgets/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen2.dart';


class ProfileScreen extends StatelessWidget {


    

  @override
  Widget build(BuildContext context) {
    

    return PetMatchSingleScreen(
      backArrow: true,
      header: ProfileCover(),
      body: Column(
        children: [
          NewPostWidget(),
          Text("Michael"),
          Text("Samy"),
          Text("Samy"),
          Text("Samy"),
          Text("Samy"),

        ],
      ),
    );
      }
}