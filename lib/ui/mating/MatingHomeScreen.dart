import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/mating/RecentMatings.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';

class MatingHomeScreen extends StatelessWidget {

  final PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      title: Text(
        "Matings",
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: PetsTheme.getMuchLargerFont(),
            color: PetsTheme.whiteBarColor,
            fontWeight: FontWeight.bold),
      ),
      bodyBackgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
            top: PetsTheme.getMuchLargerPadMarg(),
            left: PetsTheme.getMuchLargerPadMarg(),
            right: PetsTheme.getMuchLargerPadMarg()),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: Text(
                      "Recent",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }),
                GestureDetector(
                  child: Text("Crush",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontWeight: FontWeight.bold,
                          color: PetsTheme.petsHintGrayColor)),
                  onTap: () {
                    _pageController.animateToPage(1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear);
                  },
                ),
                GestureDetector(
                    child: Text("Family",
                        style: TextStyle(
                            fontSize: PetsTheme.getLargeFont(),
                            fontWeight: FontWeight.bold,
                            color: PetsTheme.petsHintGrayColor)),
                    onTap: () {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  RecentMatings(),
                  Center(child: Text("Crush")),
                  Center(child: Text("Family")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
