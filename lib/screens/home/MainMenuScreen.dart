import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(PetsTheme.getLargerFont());
    return PetMatchContainer(
      header: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                child: UserAvatar(image: "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",imageRatio: 1,)
              ),
              SizedBox(width: PetsTheme.getLargePadMarg(),),
              Text("Mina Kamal", style: TextStyle(fontSize: PetsTheme.getLargerFont(), color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
                  child: Column(
                    children: [
                      Container(
                        height: 35, width: 35,
                        margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                        child: UserAvatar(image: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",imageRatio: 1,),
                      ),
                      Text("Bella", style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
                  child: Column(
                    children: [
                      Container(
                        height: 35, width: 35,
                        margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                        child: UserAvatar(image: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",imageRatio: 1,),
                      ),
                      Text("Rusty",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
                  child: Column(
                    children: [
                      Container(
                        height: 35, width: 35,
                        margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                        child: UserAvatar(image: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",imageRatio: 1,),
                      ),
                      Text("Rex",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
                  child: Column(
                    children: [
                      Container(
                        height: 35, width: 35,
                        margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                        child: UserAvatar(image: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",imageRatio: 1,),
                      ),
                      Text("Lucky", style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bodyBackgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Friends", iconPath: "assets/images/icons/menu/friends.svg", 
            onTap: () {},
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Pets", iconPath: "assets/images/icons/menu/pets.svg",
            onTap: () {},
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Trainers", iconPath: "assets/images/icons/menu/trainers.svg",
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Vets", iconPath: "assets/images/icons/menu/vets.svg"
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Shops", iconPath: "assets/images/icons/menu/shops.svg"
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "My Walks", iconPath: "assets/images/icons/menu/walks.svg"),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Matings", iconPath: "assets/images/icons/menu/matings.svg"),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Settings", iconPath: "assets/images/icons/menu/settings.svg"
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Help & Support", iconPath: "assets/images/icons/menu/helpSupport.svg"
          ),
          MainMenuItem(
            margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            text: "Logout", iconPath: "assets/images/icons/menu/logout.svg"
          ),
        ],
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
            SvgPicture.asset(iconPath,
              color: Colors.white, 
              width: PetsTheme.verySmallIconSize(), 
              height: PetsTheme.verySmallIconSize() ,
            ),
            SizedBox(width: PetsTheme.getLargePadMarg(),),
            Text(text, style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white), ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}