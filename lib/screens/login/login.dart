import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/home/home.dart';
import 'package:petmatch/screens/login/regTypes.dart';
import 'package:petmatch/screens/login/sendMailCode.dart';
import 'package:petmatch/theme/petsTheme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureTextFlag = true;
  @override
  Widget build(BuildContext context) {
    //some dimensions
    final double fieldsWidth = MediaQuery.of(context).size.width * .7;
    final double boxRadius = MediaQuery.of(context).size.width * .075;
    final double logoMaxHeight = 0.1 * MediaQuery.of(context).size.height;

    void _togglePW() {
      print("GET HENAA");
      setState(() {
        obscureTextFlag = !obscureTextFlag;
      });
      print(obscureTextFlag);
    }

    void submitForm() {
      print("Submitting");
      if (true) {
        Navigator.of(context).pushReplacement(new PageTransition(child: HomeScreen(), type: PageTransitionType.fade));
      }
    }

    void signUp() {
      print("SignUp Aho");
      Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: RegTypesScreen()));
    }

    void forgotPass() {
      print("Forget Pass");
      Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: VerifyMailCodeScreen()));
    }

    void fbLogin() {
      print("FB Login");
    }

    void googleLogin() {
      print("Google");
    }

    return BaseScreen(
      isRightPadding: false,
      isLeftPadding: false,
      isBottomPadding: false,
      noTitle: true,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //Empty space at the top // 1 flex
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Container(),
              ),
              //Logo space // 3 flex
              Flexible(
                  fit: FlexFit.loose,
                  flex: 4,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      constraints: BoxConstraints(maxHeight: logoMaxHeight),
                      child: Hero(
                          tag: "logo",
                          child: Image.asset(
                            "assets/images/logo/orig.png",
                            color: PetsTheme.whiteBarColor,
                          )))),
              //Title Petmatch // 2 flex
              Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Welcome to PetMatch!",
                        style: TextStyle(
                            fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold, fontSize: PetsTheme.getMuchLargerFont(context)),
                      ),
                      Text(
                        "All Pets, One Place",
                        style: TextStyle(
                            fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.normal, fontSize: PetsTheme.getLargeFont(context)),
                      ),
                    ],
                  ),
                ),
              ),
              //Login form fields // 4 flex
              Flexible(
                  flex: 21,
                  fit: FlexFit.tight,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: PetsTheme.whiteBarColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius), topRight: Radius.circular(boxRadius))),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Container(),
                            ),
                            //Sign In Titile
                            Flexible(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign in to continue",
                                  style: TextStyle(
                                      color: PetsTheme.petsBlueColor,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: PetsTheme.getMuchLargerFont(context)),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    constraints: BoxConstraints(maxWidth: fieldsWidth),
                                    margin: EdgeInsets.only(bottom: PetsTheme.getSmallerPadMarg(context)),
                                    child: Padding(
                                        padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg(context)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "E-mail", hintStyle: TextStyle(fontFamily: "Segoe", fontSize: 16, color: PetsTheme.petsGrayColor)),
                                          controller: _emailController,
                                          style: TextStyle(fontFamily: "Segoe", fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    width: fieldsWidth,
                                    margin: EdgeInsets.only(top: PetsTheme.getSmallPadMarg(context)),
                                    child: Padding(
                                        padding: EdgeInsets.only(left: PetsTheme.getLargePadMarg(context)),
                                        child: Stack(
                                          fit: StackFit.loose,
                                          alignment: Alignment.centerRight,
                                          children: [
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(fontFamily: "Segoe", fontSize: 16, color: PetsTheme.petsGrayColor)),
                                              obscureText: obscureTextFlag,
                                              controller: _passwordController,
                                              style: TextStyle(fontFamily: "Segoe", fontSize: 16),
                                            ),
                                            SizedBox(
                                              child: ButtonTheme(
                                                  padding: EdgeInsets.all(0), //adds padding inside the button
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
                                                  minWidth: 0, //wraps child's width
                                                  height: 0, //wraps child's height
                                                  child: FlatButton(
                                                    child: Icon(
                                                      FontAwesomeIcons.solidEye,
                                                      color: PetsTheme.petsGrayColor,
                                                    ),
                                                    onPressed: _togglePW,
                                                  )),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * .10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: FlatButton(
                                          onPressed: signUp,
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(fontFamily: "Oregano", fontSize: PetsTheme.getLargeFont(context)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: FlatButton(
                                          onPressed: forgotPass,
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Forgot ur Password?",
                                            style: TextStyle(fontFamily: "Oregano", fontSize: PetsTheme.getLargeFont(context)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]))),
              //spacing 1 flex
            ],
          ),
        ),
      ),
    );
  }
}
