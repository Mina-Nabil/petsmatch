import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/sendPhoneCode.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/regTextField.dart';

class OwnerRegScreen extends StatefulWidget {
  @override
  _OwnerRegScreenState createState() => _OwnerRegScreenState();
}

class _OwnerRegScreenState extends State<OwnerRegScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        noTitle: true,
        child: Column(
          children: [
            Flexible(flex: 1, child: Container()),
            Flexible(
                flex: 2,
                child: Container(
                  child: Text("What are you looking for?"),
                )),
            Flexible(
              flex: 2,
              child: Row(children: [
                Flexible(flex: 7,
                child: TextField(),),
                Flexible(flex: 3,
                child: Text("Cancel"),)
              ]),
            ),
            Flexible(flex: 18, child: Container()),
          ],
        ));
  }
}
