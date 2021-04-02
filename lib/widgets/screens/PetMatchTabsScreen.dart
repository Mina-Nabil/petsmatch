import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/UI/profile/ProfileScreen.dart';
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
import 'package:petmatch/ui/mating/FindMateScreen.dart';
import 'package:petmatch/ui/mating/FindMateStartScreen.dart';
import 'package:petmatch/ui/mating/MatingHomeScreen.dart';
import 'package:petmatch/ui/mating/SelectPetScreen.dart';
import 'package:petmatch/ui/profile/FriendsListScreen.dart';
import 'package:petmatch/ui/profile/PetProfileScreen.dart';
import 'package:petmatch/ui/profile/PetsListScreen.dart';
import 'package:petmatch/ui/profile/PhotosScreen.dart';
import 'package:petmatch/ui/services/MatingHomeScreen.dart';
import 'package:petmatch/ui/train/TrainHomeScreen.dart';
import 'package:petmatch/ui/walking/WalkingHomeScreen.dart';
import 'package:petmatch/widgets/custom/CustomStack.dart';
import 'package:petmatch/widgets/main/NavBarHolder.dart';

enum PawScreens {mating, services, training, walking}

class PetMatchMainScreen extends StatefulWidget {
  Key matingKey = UniqueKey();
  Key serKey = UniqueKey();
  Key walkKey = UniqueKey();
  Key vetKey = UniqueKey();



  @override
  _PetMatchMainScreenState createState() => _PetMatchMainScreenState();
}

class _PetMatchMainScreenState extends State<PetMatchMainScreen> with SingleTickerProviderStateMixin {
  CupertinoTabController _tabController;
  int _previousTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new CupertinoTabController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTap(int index) {

    print("onTap $_previousTabIndex $index");
    if(index == 1 || index == 3 || index == 4 || index == 5 || index == 6 || index == 8) {
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
              onTap: _onTap, items: [
              // [0]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/icons/pages/home.svg",
                  color: _tabController.index == 0 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                ),
              ),
              // [1]
              BottomNavigationBarItem(icon: Container()),
              // [2]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/icons/pages/notifications.svg",
                  color: _tabController.index == 2 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                ),
              ),
              // 4 hidden tabs for paw
              BottomNavigationBarItem(icon: Container()), // [3]
              BottomNavigationBarItem(icon: Container()), // [4]
              BottomNavigationBarItem(icon: Container()), // [5]
              BottomNavigationBarItem(icon: Container()), // [6]
              // [7]
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                "assets/images/icons/pages/chat.svg",
                color: _tabController.index == 7 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
              )),
              BottomNavigationBarItem(icon: Container()), // [8]
              // [9]
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Paths.more_icon_svg_file,
                  color: _tabController.index == 9 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                )),
            ]),
            tabBuilder: (context, i) {
              print("michael");
              print(i);
              return CupertinoTabView(
                 
                builder: (context) {
                  switch (i) {
                    case 0:
                      return HomeScreen();
                    case 2:
                      return NotificationsScreen();
                    case 3:
                      return ServicesHomeScreen();
                    case 4 : 
                      return TrainHomeScreen();
                    case 5 : 
                      return MatingHomeScreen();
                    case 6 :
                      return WalkingHomeScreen();
                    case 7:
                      return ChatScreen();
                    case 9:
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
                _tabController.index = 3;
              });
            },

            trainingCallback: () {
              setState(() {
                _tabController.index = 4;
              });
            },

            matingCallback: () {
              setState(() {
                _tabController.index = 5;
              });
            },

            walkingCallback: () {
              setState(() {
                _tabController.index = 6;
              });
            },
          ))),
    ]);
  }
}
