import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/LoginScreenSetup.dart';
import 'package:petmatch/widgets/LoginSubmitButton.dart';
import 'package:petmatch/widgets/RegistrationTypeIcon.dart';

enum userType { owner, trainer, store, vet }

class RegTypeSelectedScreen extends StatelessWidget {
  final userType selectedType;

  String iconPath;
  Color iconBgColor;
  bgColor screenBgColor;
  Color iconColor;
  String iconCaption;

  Column selectedTypeRow;

  RegTypeSelectedScreen(this.selectedType) {
    switch (this.selectedType) {
      case userType.owner:
        iconBgColor = PetsTheme.petsBgBlueColor;
        screenBgColor = bgColor.blue;
        iconColor = PetsTheme.petsBlueColor;
        iconPath = Paths.owner_icon_file;
        iconCaption = "Pet Owner";
        break;
      case userType.trainer:
        iconBgColor = PetsTheme.petsBgPurpleColor;
        screenBgColor = bgColor.purple;
        iconColor = PetsTheme.petsPurpleColor;
        iconPath = Paths.trainer_icon_file;
        iconCaption = "Trainer";
        break;
      case userType.vet:
        iconBgColor = PetsTheme.petsBgCyanColor;
        screenBgColor = bgColor.cyan;
        iconColor = PetsTheme.petsCyanColor;
        iconPath = Paths.vet_icon_file;
        iconCaption = "Vet";
        break;
      case userType.store:
        iconBgColor = PetsTheme.petsBgPinkColor;
        screenBgColor = bgColor.pink;
        iconColor = PetsTheme.petsPinkColor;
        iconPath = Paths.store_icon_file;
        iconCaption = "Store";
        break;
    }

    selectedTypeRow = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(flex: 3, fit: FlexFit.loose, child: RegistrationTypeButton(iconPath, iconCaption, iconColor, iconBgColor)),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Container(
              child: LoginSubmitButton(
                callBackFunction: signUp,
              )),
        ),
      ],
    );
  }

  void signUp() {}

  @override
  Widget build(BuildContext context) {
    return LoginScreenSetup(
      backgroundColor: screenBgColor,
      formTitle: "Sign up as",
      showLogo: true,
      formWidget: selectedTypeRow,
      topbarTitle: "Welcome to Petmatch",
      topbarSubtitle: "All Pets, One Place...",
    );
  }
}
