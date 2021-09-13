import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/screens/profile/ProfileScreen.dart';
import 'package:petmatch/screens/main_screen/ConversationScreen.dart';
import 'package:petmatch/screens/main_screen/SearchScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/MainMenuScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/NotificationsScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/chatScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/HomeScreen.dart';
import 'package:petmatch/screens/post_screens/LoversScreen.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/screens/mating/FindMateScreen.dart';
import 'package:petmatch/screens/mating/FindMateStartScreen.dart';
import 'package:petmatch/screens/mating/MatingHomeScreen.dart';
import 'package:petmatch/screens/mating/PetReviewsScreen.dart';
import 'package:petmatch/screens/mating/SelectPetScreen.dart';
import 'package:petmatch/screens/profile/FriendsListScreen.dart';
import 'package:petmatch/screens/profile/PetProfileScreen.dart';
import 'package:petmatch/screens/profile/PetsListScreen.dart';
import 'package:petmatch/screens/profile/PhotosScreen.dart';
import 'package:petmatch/screens/services/ServicesHomeScreen.dart';
import 'package:petmatch/screens/train/TrainHomeScreen.dart';
import 'package:petmatch/screens/walking/WalkingHomeScreen.dart';
import 'package:petmatch/widgets/custom/CustomStack.dart';
import 'package:petmatch/widgets/main/NavBarHolder.dart';

class PetMatchMainScreen extends StatefulWidget {
  @override
  _PetMatchMainScreenState createState() => _PetMatchMainScreenState();
}

class _PetMatchMainScreenState extends State<PetMatchMainScreen> with SingleTickerProviderStateMixin {
  CupertinoTabController _tabController;
  int _previousTabIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = new CupertinoTabController(initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTap(int index) {

    print("onTap $_previousTabIndex $index");
    if(index == 0 || index == 2 || index == 4 || index == 5 || index == 6 || index == 7 || index == 9 || index == 11) {
      setState(() {
        _tabController.index = _previousTabIndex;
      });
    } else {
      setState(() {
        _tabController.index = index;
        _previousTabIndex = index;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return CustomStack(
      alignment: Alignment.bottomCenter,
      isNavBar: true,
      children: [

        SafeArea(
          top: false,
          bottom: false,
          child: CupertinoTabScaffold(
            backgroundColor: Colors.black,
            controller: _tabController,
            tabBar: CupertinoTabBar(
              backgroundColor: Colors.white,
              onTap: _onTap,
              currentIndex: 1,
              items: [
              // [0]
              BottomNavigationBarItem(icon: Container()),
              // [1]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/icons/pages/home.svg",
                  color: _tabController.index == 1 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                ),
              ),
              // [2]
              BottomNavigationBarItem(icon: Container()),
              // [3]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/icons/pages/notifications.svg",
                  color: _tabController.index == 3 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                ),
              ),
              // 4 hidden tabs for paw
              BottomNavigationBarItem(icon: Container()), // [4]
              BottomNavigationBarItem(icon: Container()), // [5]
              BottomNavigationBarItem(icon: Container()), // [6]
              BottomNavigationBarItem(icon: Container()), // [7]
              // [8]
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                "assets/images/icons/pages/chat.svg",
                color: _tabController.index == 8 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
              )),
              BottomNavigationBarItem(icon: Container()), // [9]
              // [10]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Paths.more_icon_svg_file,
                  color: _tabController.index == 10 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
              )),
              BottomNavigationBarItem(icon: Container()),// [11]
            ]),
            tabBuilder: (context, i) {
              print("michael");
              print(i);
              return CupertinoTabView(

                builder: (context) {
                  switch (i) {
                    case 1:
                      return HomeScreen();
                    case 3:
                      return NotificationsScreen();
                    case 4:
                      return ServicesHomeScreen();
                    case 5 :
                      return TrainHomeScreen();
                    case 6 :
                      return MatingHomeScreen();
                    case 7 :
                      return WalkingHomeScreen();
                    case 8:
                      return ChatScreen();
                    case 10:
                      return MainMenuScreen();
                    default:
                    print("Hwa da");
                      return null;
                  }
                },
                routes: {
                  'search': (context) => SearchScreen(),
                  'post': (context) => PostScreen(),
                  'lovers': (context) => LoversScreen(),
                  'conversation': (context) => ConversationScreen(),
                  'profile': (context) => ProfileScreen(),
                  'petProfile': (context) => PetProfileScreen(),
                  'friends': (context) => FriendsListScreen(),
                  'pets': (context) => PetsListScreen(),
                  'photos' : (context) => PhotosScreen(),
                  'Mating/SelectPet' : (context) => SelectPetScreen(),
                  'Mating/FindMateStart' : (context) => FindMateStartScreen(),
                  'Mating/FindMate' : (context) => FindMateScreen(),
                  'Mating/PetReviews' : (context) => PetReviewsScreen(),
                },
              );

            },

          ),
        ),

      //Paw
      SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: NavBarHolder(
            servicesCallback: () {  setState(() {
                _tabController.index = 4;
              });
            },

            trainingCallback: () {
              setState(() {
                _tabController.index = 5;
              });
            },

            matingCallback: () {
              setState(() {
                _tabController.index = 6;
              });
            },

            walkingCallback: () {
              setState(() {
                _tabController.index = 7;
              });
            },
          ))),
    ]);
  }
}
