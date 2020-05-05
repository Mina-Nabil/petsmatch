import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/home/home.dart';
import 'package:petmatch/screens/login/regTypes.dart';
import 'package:petmatch/screens/login/sendMailCode.dart';
import 'package:petmatch/theme/petsTheme.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //some dimensions
    final double fieldsWidth = MediaQuery.of(context).size.width * .7;

    //form controllers
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    void submitForm() {
      print("Submitting");
      if(true){
        Navigator.of(context).pushReplacement(new PageTransition(child: HomeScreen(), type: PageTransitionType.fade));
      }
    }

    void signUp() {
      print("SignUp Aho");
      Navigator.of(context).push(PageTransition(
          type: PageTransitionType.fade, child: RegTypesScreen()));
    }

    void forgotPass() {
      print("Forget Pass");
      Navigator.of(context).push(PageTransition(
          type: PageTransitionType.fade, child: VerifyMailCodeScreen()));
    }

    void fbLogin() {
      print("FB Login");
    }

    void googleLogin() {
      print("Google");
    }

    return BaseScreen(
      noTitle: true,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*.9,
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
                  flex: 3,
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset("assets/images/logo.png"))),
              //Title Petmatch // 2 flex
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "PetMatch",
                    style: TextStyle(
                        fontFamily: "Oregano",
                        fontSize: PetsTheme.getVeryLargeFont(context)),
                  ),
                ),
              ),
              //Login form fields // 4 flex
              Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * .5),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .10),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    constraints:
                                        BoxConstraints(maxWidth: fieldsWidth),
                                    margin: EdgeInsets.only(
                                        bottom: PetsTheme.getSmallerPadMarg(
                                            context)),
                                    color: PetsTheme.fieldsBackGroundColor,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: PetsTheme.getMeduimPadMarg(
                                                context)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "E-mail",
                                              hintStyle: TextStyle(
                                                  fontFamily: "Segoe",
                                                  fontSize: 16,
                                                  color: PetsTheme.hintColor)),
                                          controller: _emailController,
                                          style: TextStyle(
                                              fontFamily: "Segoe",
                                              fontSize: 16),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    width: fieldsWidth,
                                    margin: EdgeInsets.only(
                                        top:
                                            PetsTheme.getSmallPadMarg(context)),
                                    color: PetsTheme.fieldsBackGroundColor,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: PetsTheme.getLargePadMarg(
                                                context)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  fontFamily: "Segoe",
                                                  fontSize: 16,
                                                  color: PetsTheme.hintColor)),
                                          obscureText: true,
                                          controller: _passwordController,
                                          style: TextStyle(
                                              fontFamily: "Segoe",
                                              fontSize: 16),
                                        )),
                                  ),
                                  Expanded(
                                      child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      margin: EdgeInsets.all(0),
                                      child:
                                          FaIcon(FontAwesomeIcons.chevronRight),
                                    ),
                                    onPressed: submitForm,
                                  )),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        .10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: FlatButton(
                                          onPressed: signUp,
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontFamily: "Oregano",
                                                fontSize:
                                                    PetsTheme.getLargeFont(
                                                        context)),
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
                                            style: TextStyle(
                                                fontFamily: "Oregano",
                                                fontSize:
                                                    PetsTheme.getLargeFont(
                                                        context)),
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
              Flexible(flex: 1, child: Container()),
              // fb login 4
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: PetsTheme.fbBlue,
                          width: MediaQuery.of(context).size.width * .6,
                          margin: EdgeInsets.symmetric(
                              vertical: PetsTheme.getSmallerPadMarg(context)),
                          child: FlatButton(
                            onPressed: fbLogin,
                            splashColor: Colors.blueAccent,
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  fit: FlexFit.loose,
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.all(
                                        PetsTheme.getMeduimPadMarg(context)),
                                    child: FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                      size:
                                          PetsTheme.getMuchLargerFont(context),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  fit: FlexFit.loose,
                                  child: Container(
                                    child: Text(
                                      "Login with Facebook",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontFamily: "Segeo",
                                          color: Colors.white,
                                          fontSize:
                                              PetsTheme.getSmallFont(context)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: PetsTheme.googleRed,
                          width: MediaQuery.of(context).size.width * .6,
                          child: FlatButton(
                            onPressed: googleLogin,
                            splashColor: Colors.redAccent,
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                      margin: EdgeInsets.all(
                                          PetsTheme.getMeduimPadMarg(context)),
                                      child: FaIcon(
                                        FontAwesomeIcons.googlePlusG,
                                        color: Colors.white,
                                        size: PetsTheme.getMuchLargerFont(
                                            context),
                                      )),
                                ),
                                Flexible(
                                    flex: 7,
                                    child: Container(
                                      child: Text(
                                        "Login with Google+",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Segeo",
                                            color: Colors.white,
                                            fontSize: PetsTheme.getSmallFont(
                                                context)),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // spacing 1 flex
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
