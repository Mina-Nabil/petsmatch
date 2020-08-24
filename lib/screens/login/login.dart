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
  Color obscureTextColor = PetsTheme.petsGrayColor;
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
        if (obscureTextFlag)
          obscureTextColor = PetsTheme.petsGrayColor;
        else
          obscureTextColor = PetsTheme.petsBgBlueColor;
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
                        child: SvgPicture.asset(
                          "assets/images/logo/orig.svg",
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
                      "All Pets, One Place..",
                      style: TextStyle(
                          fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.normal, fontSize: PetsTheme.getLargeFont(context)),
                    ),
                  ],
                ),
              ),
            ),
            //Login form fields // 5 flex
            Flexible(child: Container(), flex: 1),
            Flexible(
                flex: 23,
                fit: FlexFit.loose,
                child: Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallestPadMarg(context)),
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
                          //Sign In Title - flex 3
                          Flexible(
                            flex: 3,
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
                          //Email Field - flex 5
                          Flexible(
                            flex: 5,
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
                          //Password - flex 5
                          Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
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
                                                    padding: EdgeInsets.all(PetsTheme.getSmallerPadMarg(context)), //adds padding inside the button

                                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
                                                    minWidth: 0, //wraps child's width
                                                    height: 0, //wraps child's height
                                                    child: FlatButton(
                                                      highlightColor: Colors.transparent,
                                                      splashColor: Colors.transparent,
                                                      child: SizedBox(
                                                        child: Icon(
                                                          FontAwesomeIcons.solidEye,
                                                          color: obscureTextColor,
                                                        ),
                                                      ),
                                                      onPressed: _togglePW,
                                                    )),
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                                Container(
                                    width: fieldsWidth,
                                    margin: EdgeInsets.only(top: PetsTheme.getMeduimPadMarg(context)),
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: PetsTheme.getSmallFont(context), color: PetsTheme.petsGrayColor.withOpacity(0.5)),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          //Sign in button - flex 2
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.center,
                              width: fieldsWidth,
                              decoration:
                                  BoxDecoration(color: PetsTheme.petsGreenColor, borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont(context))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg(context)),
                                        child: SizedBox(
                                            child: SvgPicture.asset(
                                          "assets/images/icons/twoPaws.svg",
                                          color: PetsTheme.whiteBarColor,
                                        )),
                                      )),
                                  Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        child: Text(
                                          "Let's go",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w500,
                                              fontSize: PetsTheme.getSmallFont(context)),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          //Other sign in options
                          Flexible(
                              flex: 5,
                              child: Container(
                                width: fieldsWidth * 0.5,
                                alignment: Alignment.center,
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                  Flexible(
                                      flex: 1,
                                      child: Container(
                                          child: SizedBox(
                                        child: Text(
                                          "Sign in with",
                                          style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getSmallFont(context)),
                                        ),
                                      ))),
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargerPadMarg(context)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: Container(
                                                width: 50,
                                                decoration: BoxDecoration(color: PetsTheme.fbBlue, shape: BoxShape.circle),
                                                child: SizedBox.expand(child: Icon(FontAwesomeIcons.facebookF, color: Colors.white,)))
                                              ),
                                          Flexible(
                                              flex: 1,
                                              child: Container(
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: PetsTheme.googleRed,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SizedBox.expand(child: Icon(FontAwesomeIcons.googlePlusG, color: Colors.white,)))),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ))
                        ]))),
            //spacing 1 flex
          ],
        ),
      ),
    );
  }
}
