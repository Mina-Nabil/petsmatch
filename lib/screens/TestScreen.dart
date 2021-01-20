import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/CommonScreenSetup.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      Container(), Container(), 
      screenBgColor: bgColor.cyan, 
      screenBgMask: bgMask.mating ,
      isNavBar: true,
      isSmallTop: true,

    );
  }
}