import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/screens/main_screen/main_tabs/MainMenuScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/NotificationsScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/chatScreen.dart';
import 'package:petmatch/screens/main_screen/main_tabs/HomeScreen.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/CustomStack.dart';
import 'package:petmatch/widgets/main/NavBarHolder.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';

class PetMatchMainScreen extends StatefulWidget {
  @override
  _PetMatchMainScreenState createState() => _PetMatchMainScreenState();
}

class _PetMatchMainScreenState extends State<PetMatchMainScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
    _tabController.addListener(onTap);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  onTap() {
    int index = _tabController.previousIndex;
    setState(() {
      if (_tabController.index == 2) //middle empty tab
        _tabController.index = index;
    });
  }

  List<Widget> tabs = [
    HomeScreen2(),
    NotificationsScreen(),
    Container(),
    ChatScreen(),
    MainMenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomStack(alignment: Alignment.bottomCenter, isNavBar: true, children: [
      // Background Image
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: PetsTheme.currentBgMainColor,
        child: Image.asset(
          "assets/images/masks/def_blue.png",
          fit: BoxFit.cover,
          color: PetsTheme.currentBgMainColor.withOpacity(1.0),
          colorBlendMode: BlendMode.srcOut,
        ),
      ),

      DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: TabBarView(physics: NeverScrollableScrollPhysics(), controller: _tabController, children: tabs),
          bottomNavigationBar: Container(
            // padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            color: Colors.white,
            child: SafeArea(
                child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    "assets/images/icons/pages/home.svg",
                    color: _tabController.index == 0 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                  ),
                ),
                Tab(
                  icon: SvgPicture.asset(
                    "assets/images/icons/pages/notifications.svg",
                    color: _tabController.index == 1 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                  ),
                ),
                Tab(
                  text: "",
                ),
                Tab(
                    icon: SvgPicture.asset(
                  "assets/images/icons/pages/chat.svg",
                  color: _tabController.index == 3 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                )),
                Tab(
                    icon: SvgPicture.asset(
                  Paths.more_icon_svg_file,
                  color: _tabController.index == 4 ? PetsTheme.currentMainColor : PetsTheme.petsGrayIconColor,
                )),
              ],
              indicatorColor: Colors.transparent,
            )),
          ),
        ),
      ),

      //Paw
      Align(alignment: Alignment.bottomCenter, child: SafeArea(child: NavBarHolder())),
    ]);
  }
}
