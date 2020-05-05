import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      noTitle: true,
      isNavBar: true,
    );
  }
}