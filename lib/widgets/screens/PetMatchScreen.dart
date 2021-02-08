import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/theme/petsTheme.dart';


class PetMatchScreen extends StatelessWidget {
  PetMatchScreen({
    @required this.body,
    this.title,
    this.backArrow = false,
  });

  final Widget body;
  final Widget title;
  final bool backArrow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [


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
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: backArrow? GestureDetector(
                child: Center(child: FaIcon(FontAwesomeIcons.chevronLeft)),
                onTap: () => Navigator.of(context).pop(),
              ) : null,
              title: title,
            ),
            
            body: body,
          ),
        ),
      
      ],
    );
  }
}