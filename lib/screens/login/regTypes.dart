import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/ownerReg.dart';
import 'package:petmatch/screens/login/trainerReg.dart';
import 'package:petmatch/theme/petsTheme.dart';

class RegTypesScreen extends StatelessWidget {
  double fieldWidthRatio = .8;
  double fieldMinHeightRatio = .075;
  double fieldMaxHeightRatio = .1;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        noTitle: true,
        child: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //Empty space at the top // 1flex
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(),
                      ),
                      //Logo space // 3flex
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 3,
                          child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset("assets/images/logo.png"))),

                      //Title Petmatch // 2flex
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
                      // Title 2 flex
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(
                              PetsTheme.getLargePadMarg(context)),
                          child: Text(
                            "Register as:",
                            style: TextStyle(
                                fontFamily: "Oregano",
                                fontSize:
                                    PetsTheme.getEvenMuchLargerFont(context)),
                          ),
                        ),
                      ),
                      // buttons 6 flex
                      Flexible(
                        flex: 6,
                        fit: FlexFit.tight,
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Wrap(
                            children: <Widget>[
                              buildTypeContainer(
                                  context,
                                  "Pet Owner / Lover",
                                  () => Navigator.of(context).push(
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: OwnerRegScreen()))),
                              buildTypeContainer(
                                  context,
                                  "Trainer",
                                  () => Navigator.of(context).push(
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: TrainerRegScreen()))),
                            ],
                          ),
                        ),
                      ),
                      //back button 2 flex
                      Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () => Navigator.pop(context),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(
                                  PetsTheme.getSmallPadMarg(context)),
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: PetsTheme.fieldsBackGroundColor),
                                child: Text("Back",
                                    style: TextStyle(
                                        fontFamily: "Oregano",
                                        fontSize: PetsTheme.getMuchLargerFont(
                                            context))),
                              ),
                            ),
                          ))
                    ]))));
  }

  Widget buildTypeContainer(
      BuildContext context, String title, Function onPressed) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin:
            EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg(context)),
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * fieldMinHeightRatio,
            maxHeight:
                MediaQuery.of(context).size.height * fieldMaxHeightRatio),
        width: MediaQuery.of(context).size.width * fieldWidthRatio,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: PetsTheme.fieldsBackGroundColor),
        child: Text(title,
            style: TextStyle(
                fontFamily: "Oregano",
                fontSize: PetsTheme.getEvenMuchLargerFont(context))),
      ),
    );
  }
}
