import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';


class PetMatchScreen extends StatelessWidget {
  PetMatchScreen({
    @required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        //Base background
        Container(color: Colors.white),

        //Background Image
        Container(
          height: MediaQuery.of(context).size.height, 
          width: MediaQuery.of(context).size.width,
          color: PetsTheme.currentBgMainColor,
          child: Image.asset(
            "assets/images/masks/def_blue.png",
            fit: BoxFit.cover,
            color: PetsTheme.currentBgMainColor.withOpacity(1.0),
            colorBlendMode: BlendMode.srcOut,
          ),
        ),


        SafeArea(
          top: true,
          bottom: false,
          right: true,
          left: true,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: body,
          ),
        ),
      
      ],
    );
  }
}