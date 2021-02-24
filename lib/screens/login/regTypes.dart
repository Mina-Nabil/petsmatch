import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/login/regTypeSelected.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/RegistrationTypeIcon.dart';

class RegTypesScreen extends StatefulWidget {
  @override
  _RegTypesScreenState createState() => _RegTypesScreenState();
}

class _RegTypesScreenState extends State<RegTypesScreen> {
  Map<userType, bool> allTypes;

  void selectType(context, userType type) {
    setState(() {
      allTypes.forEach((key, value) {
        if (key != type) allTypes[key] = true;
      });
    });

    Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: RegTypeSelectedScreen(type)))
        //refreshing page in case it is popped up
        .then((value) => setState(() {
              allTypes = {userType.owner: false, userType.store: false, userType.trainer: false, userType.vet: false};
              PetsTheme.currentMainColor = bgColor.blue;
            }));
  }

  @override
  void initState() {
    allTypes = {userType.owner: false, userType.store: false, userType.trainer: false, userType.vet: false};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Row typesButtonsRow = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 1,
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () => selectType(context, userType.owner),
                child: RegistrationTypeButton(
                  Paths.owner_icon_file,
                  "Pet Owner",
                  isHidden: allTypes[userType.owner],
                ))),
        Flexible(
            flex: 1,
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () => selectType(context, userType.trainer),
                child: RegistrationTypeButton(Paths.trainer_icon_file, "Trainer", userTypeSelected: userType.trainer,
                    isHidden: allTypes[userType.trainer]))),
        Flexible(
            flex: 1,
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () => selectType(context, userType.vet),
                child:
                    RegistrationTypeButton(Paths.vet_icon_file, "Vet",  userTypeSelected: userType.vet,isHidden: allTypes[userType.vet]))),
        Flexible(
            flex: 1,
            child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () => selectType(context, userType.store),
                child: RegistrationTypeButton(Paths.store_icon_file, "Store", userTypeSelected: userType.store,
                    isHidden: allTypes[userType.store]))),
      ],
    );

    return LoginScreenSetup(
      formTitle: "Sign up as",
      showLogo: true,
      backgroundMask: bgMask.services,
      formWidget: Column (children: [
        Flexible(flex: 2, child: typesButtonsRow),
        Flexible(flex: 3, child: Container(),)
      ]),
      topbarTitle: "Welcome to Petmatch",
      topbarSubtitle: "All Pets, One Place...",
      backArrow: true,
    );
  }
}
