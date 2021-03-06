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
import 'package:petmatch/ui/profile/FriendsListScreen.dart';
import 'package:petmatch/ui/profile/PetProfileScreen.dart';
import 'package:petmatch/ui/profile/PetsListScreen.dart';
import 'package:petmatch/widgets/custom/CustomStack.dart';
import 'package:petmatch/widgets/main/NavBarHolder.dart';

class PetMatchMainScreen extends StatefulWidget {
  @override
  _PetMatchMainScreenState createState() => _PetMatchMainScreenState();
}

class _PetMatchMainScreenState extends State<PetMatchMainScreen> with SingleTickerProviderStateMixin {
  CupertinoTabController _tabController;

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
    setState(() {
      _tabController.index = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return CustomStack(alignment: Alignment.bottomCenter, isNavBar: true, children: [
      // Background Image
   /*   Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: PetsTheme.currentBgMainColor,
        child: Image.asset(
          "assets/images/masks/def_blue.png",
          fit: BoxFit.cover,
          color: PetsTheme.currentBgMainColor.withOpacity(1.0),
          colorBlendMode: BlendMode.srcOut,
        ),
      ),*/

  SafeArea(
    top: false,
    bottom: false,
    child: CupertinoTabScaffold(
      backgroundColor: Colors.black,
      controller: _tabController,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/pages/home.svg",
               color: _tabController.index == 0 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/pages/notifications.svg",
              color: _tabController.index == 1 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Container()
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/pages/chat.svg",
              color: _tabController.index == 3 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
            )
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Paths.more_icon_svg_file,
              color: _tabController.index == 4 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
            )
          ),
        ]
      ),
      tabBuilder: (context, i){
        return CupertinoTabView(
          builder: (context) {
            switch (i) {
              case 0:
                return  HomeScreen();
                break;
              case 1:
                return  NotificationsScreen();
                break;
              case 3:
                return  ChatScreen();
                break;
              case 4:
                return  MainMenuScreen();
                break;
              default:
                return null;
            }
          },

          routes: {
            'search' : (context) => SearchScreen(),
            'post'   : (context) => PostScreen(),
            'lovers' : (context) => LoversScreen(),
            'conversation' : (context) => ConversationScreen(),
            'profile' : (context) => ProfileScreen(),
            'petProfile' : (context) => PetProfileScreen(),
            'friends' : (context) => FriendsListScreen(),
            'pets' : (context) => PetsListScreen(),
          },
        );
      },
 
        ),
  ),   

      //Paw
      SafeArea(child: Align(alignment: Alignment.bottomCenter, child:NavBarHolder())),
    ]);
  }
}
