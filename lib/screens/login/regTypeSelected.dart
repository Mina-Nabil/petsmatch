import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/login/ownerRegistration.dart';
import 'package:petmatch/screens/login/storeRegistration.dart';
import 'package:petmatch/screens/login/trainerRegistration.dart';
import 'package:petmatch/screens/login/vetRegistration.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/buttons/RegistrationTypeIcon.dart';

enum userType { owner, trainer, store, vet }

class RegTypeSelectedScreen extends StatelessWidget {
  final userType selectedType;

  String iconPath;
  String iconCaption;

  Column selectedTypeRow;

  RegTypeSelectedScreen(this.selectedType) {
    switch (this.selectedType) {
      case userType.owner:
        iconPath = Paths.owner_icon_file;
        iconCaption = "Pet Owner";
        PetsTheme.currentMainColor = bgColor.blue;
        break;
      case userType.trainer:
        iconPath = Paths.trainer_icon_file;
        iconCaption = "Trainer";
         PetsTheme.currentMainColor = bgColor.purple;
        break;
      case userType.vet:
        iconPath = Paths.vet_icon_file;
        iconCaption = "Vet";
         PetsTheme.currentMainColor = bgColor.cyan;
        break;
      case userType.store:
        iconPath = Paths.store_icon_file;
        iconCaption = "Store";
         PetsTheme.currentMainColor = bgColor.pink;
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
        Flexible(flex: 3, fit: FlexFit.loose, child: RegistrationTypeButton(iconPath, iconCaption)),
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
      formTitle: "Sign up as",
      showLogo: true,
      formWidget: selectedTypeRow,
      topbarTitle: "Welcome to Petmatch",
      topbarSubtitle: "All Pets, One Place...",
    );
  }
}
