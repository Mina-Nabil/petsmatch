import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/ownerRegistration.dart';
import 'package:petmatch/screens/login/storeRegistration.dart';
import 'package:petmatch/screens/login/trainerRegistration.dart';
import 'package:petmatch/screens/login/vetRegistration.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/LoginScreenSetup.dart';
import 'package:petmatch/widgets/SubmitButton.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    void signUp() {
      switch (selectedType) {
        case userType.owner:
          Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: OwnerRegistrationScreen()));
          break;
        case userType.trainer:
          Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: TrainerRegistrationScreen()));
          break;
        case userType.vet:
          Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: VetRegistrationScreen()));
          break;
        case userType.store:
          Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: StoreRegistrationScreen()));
          break;
      }
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
              child: SubmitButton(
            callBackFunction: signUp,
          )),
        ),
      ],
    );

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
