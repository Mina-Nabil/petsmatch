import 'package:flutter/material.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class FindMateStartScreen extends StatelessWidget {
  PetProvider petProvider;
  @override
  Widget build(BuildContext context) {
    petProvider = Provider.of<PetProvider>(context, listen: true);

    return PetMatchSingleScreen(
      backgroundMask: bgMask.mating,
      backArrow: true,
      title: Text("Let's find a Mate",
          style: TextStyle(
              fontSize: PetsTheme.getMuchLargerFont(),
              color: Colors.white,
              fontWeight: FontWeight.bold)),
      header: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage:
                      Image.network(petProvider.selectedPet.image).image,
                  radius: PetsTheme.radius6,
                ),
                Column(
                  children: [
                    Text(petProvider.selectedPet.name,
                        style: TextStyle(
                            fontSize: PetsTheme.getLargeFont(),
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text("Golden - 6 months",
                        style: TextStyle(
                          fontSize: PetsTheme.getMeduimFont(),
                          color: Colors.white,
                        )),
                    Text("Cairo, Egypt",
                        style: TextStyle(
                          fontSize: PetsTheme.getMeduimFont(),
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: PetsTheme.getLargePadMarg(),
            ),
          ],
        ),
      ),
      bodyBackgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              child: FittedBox(
                  child: Text(
                "Select a breed",
                style: TextStyle(
                    fontSize: PetsTheme.getMeduimFont(),
                    color: PetsTheme.currentMainColor),
              )),
              borderColor: PetsTheme.currentMainColor,
              width: double.infinity,
              onPressed: () {},
            ),
            SizedBox(
              height: PetsTheme.getLargerPadMarg(),
            ),
            RoundButton(
              child: FittedBox(
                  child: Text(
                "Let's start",
                style: TextStyle(
                    fontSize: PetsTheme.getMeduimFont(), color: Colors.white),
              )),
              borderColor: Colors.white,
              color: PetsTheme.currentMainColor,
              width: double.infinity, // good for SmallFont
              onPressed: () => Navigator.pushNamed(context, 'Mating/FindMate'),
            ),
          ],
        ),
      ),
    );
  }
}
