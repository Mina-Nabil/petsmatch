import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/login/regTypes.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureTextFlag = true;
  Color obscureTextColor = PetsTheme.petsTextGrayColor;

  @override
  void initState() {
    // blocking change in screen orientation
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    //some dimensions
    final double fieldsWidth = MediaQuery.of(context).size.width * .7;

    void _togglePW() {
      print("GET HENAA");
      setState(() {
        obscureTextFlag = !obscureTextFlag;
        if (obscureTextFlag)
          obscureTextColor = PetsTheme.petsTextGrayColor;
        else
          obscureTextColor = PetsTheme.petsBgBlueColor;
      });
      print(obscureTextFlag);
    }

    void submitForm() {
      print("Submitting");
      if (true) {
        Navigator.of(context).pushReplacementNamed('/home' );
      }
    }

    void signUp() {
      print("SignUp Aho");
      Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: RegTypesScreen())).timeout(Duration.zero);
    }

    void forgotPass() {
      print("Forget Pass");
    }

    void fbLogin() {
      print("FB Login");
      if (true) {
        Navigator.of(context).pushReplacementNamed('home' );
      }
    }

    void googleLogin() {
      print("Google");
      if (true) {
        Navigator.of(context).pushReplacementNamed('/home' );
      }
    }

    return LoginScreenSetup(
        backgroundColor: bgColor.blue,
        isSmallTopArea: false,
        showLogo: true,
        isPortraitLock: true,
        topbarSubtitle: "All Pets, One Place...",
        formTitle: "Welcome to PetMatch!",
        topbarTitle: "Welcome to PetMatch",
        formWidget: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Email Field - flex 5
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(maxWidth: fieldsWidth),
                    margin: EdgeInsets.only(bottom: PetsTheme.getSmallerPadMarg()),
                    child: Padding(
                        padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg()),
                        child: TextFormField(
                          decoration:
                              InputDecoration(hintText: "E-mail", hintStyle: TextStyle(fontFamily: "Segoe", fontSize: 16, color: PetsTheme.petsTextGrayColor)),
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
                        margin: EdgeInsets.only(top: PetsTheme.getSmallPadMarg()),
                        child: Padding(
                            padding: EdgeInsets.only(left: PetsTheme.getLargePadMarg()),
                            child: Stack(
                              fit: StackFit.loose,
                              alignment: Alignment.centerRight,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Password", hintStyle: TextStyle(fontFamily: "Segoe", fontSize: 16, color: PetsTheme.petsTextGrayColor)),
                                  obscureText: obscureTextFlag,
                                  controller: _passwordController,
                                  style: TextStyle(fontFamily: "Segoe", fontSize: 16),
                                ),
                                SizedBox(
                                  child: ButtonTheme(
                                      padding: EdgeInsets.all(PetsTheme.getSmallerPadMarg()), //adds padding inside the button

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
                      margin: EdgeInsets.only(top: PetsTheme.getMeduimPadMarg()),
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        child: Text(
                          "Forgot password?",
                          style:
                              TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getSmallFont(), color: PetsTheme.petsTextGrayColor.withOpacity(0.5)),
                        ),
                      ))
                ],
              ),
            ),
            //Sign in button - flex 2
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: SubmitButton(
                fieldsWidth: fieldsWidth,
                callBackFunction: signUp,
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
                            style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getSmallFont()),
                          ),
                        ))),
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargerPadMarg()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                flex: 1,
                                child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(color: PetsTheme.fbBlue, shape: BoxShape.circle),
                                    child: SizedBox.expand(
                                        child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: fbLogin,
                                      child: Icon(
                                        FontAwesomeIcons.facebookF,
                                        color: Colors.white,
                                      ),
                                    )))),
                            Flexible(
                                flex: 1,
                                child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: PetsTheme.googleRed,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SizedBox.expand(
                                        child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: googleLogin,
                                      child: Icon(
                                        FontAwesomeIcons.googlePlusG,
                                        color: Colors.white,
                                      ),
                                    )))),
                          ],
                        ),
                      ),
                    )
                  ]),
                ))
          ],
        ));
  }
}
