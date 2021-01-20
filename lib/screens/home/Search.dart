import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';
import 'package:petmatch/screens/home/home.dart';
import 'package:petmatch/screens/login/regTypes.dart';
import 'package:petmatch/screens/login/sendMailCode.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/screens/login/login.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      // isNavBar: true,
        isRightPadding: false,
        isLeftPadding: false,
        isBottomPadding: false,
        noTitle: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: PetsTheme.getMuchLargerPadMarg()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container( 
                          width: MediaQuery.of(context).size.width*0.55,
                        child: FittedBox(
                          child: Text(
                            "What are you looking for?",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: PetsTheme.whiteBarColor,
                                fontWeight: FontWeight.bold,
                                fontSize: PetsTheme.getLargeFont()),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: PetsTheme.getLargePadMarg()),
                    margin: EdgeInsets.only(
                        bottom: PetsTheme.getMuchLargerPadMarg(),
                        left: PetsTheme.getMuchLargerPadMarg()),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.loose,
                            flex: 74,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: PetsTheme.whiteBarColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            )),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 26,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: PetsTheme.getMeduimPadMarg(),
                              vertical: PetsTheme.getLargePadMarg()
                            ),
                            child: FittedBox(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                color: PetsTheme.whiteBarColor,
                                fontWeight: FontWeight.normal,
                                fontSize: PetsTheme.getLargeFont()),
                          ),
                        ),
                      ))
                      
                      ],
                    )),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 15,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(
                      horizontal: PetsTheme.getSmallestPadMarg()),
                  decoration: BoxDecoration(
                      color: PetsTheme.whiteBarColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ),
            ],
          ),
        ));
  }
}
