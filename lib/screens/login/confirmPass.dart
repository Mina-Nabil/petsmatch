import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class ConfirmPassScreen extends StatelessWidget {
  void submitCode() {}

  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * .7;

    return BaseScreen(
      titleText: "Re-submit ur Password",
      isKeyBoardChangeSize: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: PetsTheme.getLargePadMarg()),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Text("Enter ur new password",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontFamily: "Oregano")),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          constraints: BoxConstraints(maxWidth: fieldsWidth),
                          margin: EdgeInsets.symmetric(
                              vertical: PetsTheme.getSmallerPadMarg()),
                          color: PetsTheme.fieldsBackGroundColor,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: PetsTheme.getMeduimPadMarg()),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontFamily: "Segoe",
                                        fontSize:
                                            PetsTheme.getLargeFont(),
                                        color: PetsTheme.hintColor)),
                                style: TextStyle(
                                    fontFamily: "Segoe",
                                    fontSize: PetsTheme.getLargeFont()),
                              ))),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: PetsTheme.getLargePadMarg()),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Text("Please re-enter the password",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontFamily: "Oregano")),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          constraints: BoxConstraints(maxWidth: fieldsWidth),
                          margin: EdgeInsets.symmetric(
                              vertical: PetsTheme.getSmallerPadMarg()),
                          color: PetsTheme.fieldsBackGroundColor,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: PetsTheme.getMeduimPadMarg()),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                        fontFamily: "Segoe",
                                        fontSize:
                                            PetsTheme.getLargeFont(),
                                        color: PetsTheme.hintColor)),
                                style: TextStyle(
                                    fontFamily: "Segoe",
                                    fontSize: PetsTheme.getLargeFont()),
                              ))),
                      Expanded(
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            margin: EdgeInsets.all(0),
                            child: FaIcon(FontAwesomeIcons.chevronRight),
                          ),
                          onPressed: submitCode,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(),
          )
        ],
      ),
    );
  }
}
