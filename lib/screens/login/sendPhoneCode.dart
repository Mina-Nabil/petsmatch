import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/confirmPass.dart';
import 'package:petmatch/theme/petsTheme.dart';



class VerifyPhoneCodeScreen extends StatefulWidget {
  @override
  _VerifyPhoneCodeScreenState createState() => _VerifyPhoneCodeScreenState();
}

class _VerifyPhoneCodeScreenState extends State<VerifyPhoneCodeScreen> {
  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * .7;

    void submitCode() {
      Navigator.of(context).pushReplacement(PageTransition(
          child: ConfirmPassScreen(), type: PageTransitionType.fade));
    }

    return BaseScreen(
      titleText: "Verify Phone Number",
      isKeyBoardChangeSize: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Please enter your phone number",
                style: TextStyle(
                    fontSize: PetsTheme.getMuchLargerFont(context),
                    fontFamily: "Oregano"),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 3,
            child: Container(
              margin:
                  EdgeInsets.only(left: PetsTheme.getLargerPadMarg(context)),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/verfMail.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: PetsTheme.getLargePadMarg(context)),
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          constraints: BoxConstraints(maxWidth: fieldsWidth),
                          margin: EdgeInsets.symmetric(
                              vertical: PetsTheme.getSmallerPadMarg(context)),
                          color: PetsTheme.fieldsBackGroundColor,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: PetsTheme.getMeduimPadMarg(context)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none),
                                style: TextStyle(
                                    fontFamily: "Segoe",
                                    fontSize: PetsTheme.getLargeFont(context)),
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
          )
        ],
      ),
    );
  }

}
