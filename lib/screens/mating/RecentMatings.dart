import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/models/Mate.dart';
import 'package:petmatch/providers/api_providers/mate_provider.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/screens/login/petRegistration.dart';
import 'package:petmatch/screens/mating/CrushTab.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:provider/provider.dart';

class RecentMatings extends StatefulWidget {
  @override
  State<RecentMatings> createState() => _RecentMatingsState();
}

class _RecentMatingsState extends State<RecentMatings> {
  bool isThereMate = false;
  UserProvider userProvider;
  PetProvider petProvider;
  MateProvider mateProvider;
  List<Mate> mates;
  List<Widget> matingTileWidget;
  void initState() {
    petProvider = Provider.of<PetProvider>(context, listen: false);
    print(petProvider.pets);
    Future.delayed(Duration.zero).then((value) => updateMates());

    super.initState();
  }

  void updateMates() async {
    int status = await mateProvider.getmates(userProvider.user.token, context);
    setState(() {
      mates = mateProvider.mates;
      if (status >= 200 && status < 300 && !mates.isEmpty) {
        isThereMate = true;
        matingTileWidget.addAll(mates.map((e) {
          MatingTile(
            image1: e.mate_from.image,
            petName1: e.mate_from.name,
            image2: e.mate_on.image,
            petName2: e.mate_on.name,
            trailing: CircularButton(
              child: SvgPicture.asset(
                "assets/images/icons/setupDate.svg",
                color: PetsTheme.currentMainColor,
              ),
              backgroundColor: PetsTheme.currentMainColor.withOpacity(0.2),
              onPressed: () {},
              radius: PetsTheme.radius2,
            ),
          );
          Divider(
            thickness: 1,
          );
        }).toList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isThereMate
        ? false
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child:
                      SvgPicture.asset("assets/images/custom/matingPet.svg")),
              SizedBox(
                height: PetsTheme.getLargerPadMarg(),
              ),
              petProvider.pets != null
                  ? Text("No mates Yet!",
                      style: TextStyle(
                          fontSize: PetsTheme.getMeduimFont(),
                          color: PetsTheme.currentMainColor))
                  : Text("No pets Yet!",
                      style: TextStyle(
                          fontSize: PetsTheme.getMeduimFont(),
                          color: PetsTheme.currentMainColor)),
              SizedBox(
                height: PetsTheme.getLargerPadMarg(),
              ),
              petProvider.pets != null
                  ? RoundButton(
                      child: FittedBox(
                          child: Text(
                        "Search for a mate",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            color: Colors.white),
                      )),
                      borderColor: Colors.white,
                      color: PetsTheme.currentMainColor,
                      width: double.infinity, // good for SmallFont
                      onPressed: () =>
                          Navigator.pushNamed(context, 'Mating/SelectPet'),
                    )
                  : RoundButton(
                      child: FittedBox(
                          child: Text(
                        "Add a pet to start mating",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            color: Colors.white),
                      )),
                      borderColor: Colors.white,
                      color: PetsTheme.currentMainColor,
                      width: double.infinity, // good for SmallFont
                      onPressed: () => Navigator.of(context).push(
                          new PageTransition(
                              child: PetRegistrationScreen(),
                              type: PageTransitionType.fade)),
                    ),
            ],
          );
  }
}
