import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/global.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/screens/login/login.dart';
import 'package:petmatch/screens/login/splash.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class MainMenuScreen extends StatelessWidget {
  UserProvider userProvider;
  CupertinoTabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = new CupertinoTabController(initialIndex: 1);

    userProvider = Provider.of<UserProvider>(context);

    return PetMatchSingleScreen(
      //scrollableHeader: false,
      header: Container(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: PetsTheme.getLargerPadMarg()),
              child: Row(
                children: [
                  Container(
                      height: 45,
                      width: 45,
                      child: UserAvatar(
                        image: userProvider.user.image,
                        imageRatio: 1,
                      )),
                  SizedBox(
                    width: PetsTheme.getLargePadMarg(),
                  ),
                  Text(userProvider.user.name,
                      style: TextStyle(
                          fontSize: PetsTheme.getLargerFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ),
      ),
      bodyBackgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*

              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Friends", iconPath: "assets/images/icons/menu/friends.svg", 
                onTap: () {},
              ),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Pets", iconPath: "assets/images/icons/menu/pets.svg",
                onTap: () {},
              ),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Trainers", iconPath: "assets/images/icons/menu/trainers.svg",
              ),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Vets", iconPath: "assets/images/icons/menu/vets.svg"
              ),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Shops", iconPath: "assets/images/icons/menu/shops.svg"
              ),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "My Walks", iconPath: "assets/images/icons/menu/walks.svg"),
              MainMenuItem(
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                text: "Matings", iconPath: "assets/images/icons/menu/matings.svg"),*/
              MainMenuItem(
                  margin: EdgeInsets.symmetric(
                      vertical: PetsTheme.getLargePadMarg()),
                  text: "Settings",
                  iconPath: "assets/images/icons/menu/settings.svg"),
              Divider(
                thickness: 1,
              ),
              MainMenuItem(
                  margin: EdgeInsets.symmetric(
                      vertical: PetsTheme.getLargePadMarg()),
                  text: "Help & Support",
                  iconPath: "assets/images/icons/menu/helpSupport.svg"),
              Divider(
                thickness: 1,
              ),
              MainMenuItem(
                  margin: EdgeInsets.symmetric(
                      vertical: PetsTheme.getLargePadMarg()),
                  text: "Logout",
                  iconPath: "assets/images/icons/menu/logout.svg",
                  onTap: () {
                    Server.setToken(null);
                    userProvider.setUser(null);
                    _tabController.dispose();

                    Navigator.of(context).push(new PageTransition(
                        child: LoginScreen(), type: PageTransitionType.fade));
                  }),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  MainMenuItem({
    @required this.text,
    @required this.iconPath,
    this.onTap,
    this.margin = EdgeInsets.zero,
  });

  final String text;
  final String iconPath;
  final Function onTap;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: margin,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: PetsTheme.currentMainColor,
              width: PetsTheme.verySmallIconSize(),
              height: PetsTheme.verySmallIconSize(),
            ),
            SizedBox(
              width: PetsTheme.getLargePadMarg(),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: PetsTheme.getLargeFont(),
                  color: PetsTheme.currentMainColor),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
