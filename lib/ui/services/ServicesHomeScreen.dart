import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/services/AllServicesScreen.dart';
import 'package:petmatch/ui/services/VetsScreen%20copy.dart';
import 'package:petmatch/ui/services/VetsScreen.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';

class ServicesHomeScreen extends StatefulWidget {
  @override
  _ServicesHomeScreenState createState() => _ServicesHomeScreenState();
}

class _ServicesHomeScreenState extends State<ServicesHomeScreen> {
  final PageController _pageController = new PageController();
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backgroundMask: bgMask.services,
      title: Text(
        "Services",
        style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
      ),
      body: Container(
        padding: EdgeInsets.only(top: PetsTheme.getMuchLargerPadMarg(), left: PetsTheme.getMuchLargerPadMarg(), right: PetsTheme.getMuchLargerPadMarg()),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: Text(
                      "All",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontWeight: FontWeight.bold,
                          color: _selectedPage == 0 ? PetsTheme.blackTextColor : PetsTheme.petsHintGrayColor),
                    ),
                    onTap: () {
                      changeSelectedPage(0);
                      _pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    }),
                GestureDetector(
                  child: Text("Vets",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          fontWeight: FontWeight.bold,
                          color: _selectedPage == 1 ? PetsTheme.blackTextColor : PetsTheme.petsHintGrayColor)),
                  onTap: () {
                    changeSelectedPage(1);
                    _pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                  },
                ),
                GestureDetector(
                    child: Text("Shops",
                        style: TextStyle(
                            fontSize: PetsTheme.getLargeFont(),
                            fontWeight: FontWeight.bold,
                            color: _selectedPage == 2 ? PetsTheme.blackTextColor : PetsTheme.petsHintGrayColor)),
                    onTap: () {
                      changeSelectedPage(2);
                      _pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    }),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) => changeSelectedPage(index),
                children: [AllServicesScreen(), VetsScreen(), ShopsScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeSelectedPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
