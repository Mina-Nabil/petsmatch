import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/widgets/CommonScreenSetup.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      Container(),
      Container(),
      isNavBar: true,
    );
  }
}
