import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';

class FindMateStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: Image.network(
                          "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg")
                      .image,
                  radius: PetsTheme.radius6,
                ),
                Column(
                  children: [
                    Text("Bella",
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
