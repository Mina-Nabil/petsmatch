import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/CommonScreenSetup.dart';
import 'package:petmatch/widgets/PetsButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      Container(),
      ListView(children: [
       GestureDetector(behavior: HitTestBehavior.translucent, child: PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor, textColor: Colors.white)),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
        PetsButton(callBackFunction: () => print("First Button"), buttonText: "1", isBorder: false, bgColor: PetsTheme.currentMainColor,textColor: Colors.white,),
      ],),
      isNavBar: true,
      isSmallTop: true,
    );
  }
}
