import 'package:flutter/material.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/services/AllServicesScreen.dart';
import 'package:petmatch/ui/services/ShopsScreen.dart';
import 'package:petmatch/ui/services/VetsScreen.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';
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
    return PetMatchSingleScreen.scrollable(
      backgroundMask: bgMask.services,
      header: Container(
        padding: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
        margin: EdgeInsets.only(top: PetsTheme.getLargePadMarg()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 229,
              height: 60,
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Find the best Services for your Pet",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: PetsTheme.getLargerFont(),
                    color: PetsTheme.whiteBarColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                width: 120,
                height: 60,
                child: CircularPetButton(PetsTheme.currentMainColor.withOpacity(.2), Paths.search_icon_path, Colors.white))
          ],
        ),
      ),
      bodyWidgets: [
        Container(
          height: MediaQuery.of(context).size.height * 2 ,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(PetsTheme.getMuchLargerPadMarg()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: PetsTheme.getLargestPadMarg(),
                          ),
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontSize: PetsTheme.getLargeFont(),
                                fontWeight: FontWeight.bold,
                                color: _selectedPage == 0 ? PetsTheme.blackTextColor : PetsTheme.petsHintGrayColor),
                          ),
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
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: PetsTheme.getLargestPadMarg(),
                          ),
                          child: Text("Shops",
                              style: TextStyle(
                                  fontSize: PetsTheme.getLargeFont(),
                                  fontWeight: FontWeight.bold,
                                  color: _selectedPage == 2 ? PetsTheme.blackTextColor : PetsTheme.petsHintGrayColor)),
                        ),
                        onTap: () {
                          changeSelectedPage(2);
                          _pageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear);
                        }),
                  ],
                ),
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
        )
      ],
    );
  }

  void changeSelectedPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
