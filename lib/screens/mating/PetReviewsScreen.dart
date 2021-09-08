import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/PetMatchRating.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class PetReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      header: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bondo2", style: TextStyle(color: Colors.white, fontSize: PetsTheme.getLargerFont(), fontWeight: FontWeight.bold),),
            Text("Ahmed Mostafa's Pet", style: TextStyle(color: Colors.white, fontSize: PetsTheme.getSmallFont()),),
            SizedBox(height: PetsTheme.getSmallPadMarg(),),
            Row(
              children: [
                SvgPicture.asset("assets/images/icons/paw.svg", color: Colors.white, width: 16,),
                SizedBox(width: PetsTheme.getSmallestPadMarg(),),
                PetMatchRating(rate: 4, size: PetsTheme.getSmallFont(), ratedColor: Colors.white, unratedColor:  Colors.white.withAlpha(50)),

                SizedBox(width: PetsTheme.getLargePadMarg(),),
                
                Icon(Icons.person, size: 20, color: Colors.white,),
                PetMatchRating(rate: 3, size: PetsTheme.getSmallFont(), ratedColor: Colors.white, unratedColor: Colors.white.withAlpha(50)),

                Expanded(child: Container()),

                //reviews
                Text("4 Reviews", style: TextStyle(color: PetsTheme.currentMainColor),)
              ],
            ),
            SizedBox(height: PetsTheme.getMeduimPadMarg(),),
          ],
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(PetsTheme.getLargePadMarg()),
        children: [
          Container(
            child: Container(
              padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
              decoration: BoxDecoration(
                color: PetsTheme.commentBgColor,
                borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
              child: Column(
                children:[
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: Image.network("https://www.incimages.com/uploaded_files/image/1920x1080/getty_624206636_200013332000928034_376810.jpg").image, radius: PetsTheme.radius2,),
                    SizedBox(width: PetsTheme.getMeduimPadMarg(),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            UserNameRole(name: "Akram Abd El-Aziz", role: "Roy's Owner"),
                            SizedBox(width: PetsTheme.getMeduimPadMarg(),),
                            Text("20 June 2020"),
                          ],
                        ),
                        SizedBox(height: PetsTheme.getSmallerPadMarg(),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset("assets/images/icons/paw.svg", color: PetsTheme.currentMainColor, width: 16,),
                            Text(" | 3.0  "),
                            Icon(Icons.person, size: 20, color: PetsTheme.currentMainColor,),
                            Text(" | 3.0  "),
                          ],
                        )
                      ],
                    )
                    
                  ],
                ),
                SizedBox(height: PetsTheme.getSmallPadMarg(),),
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor. do eiusmod tempor."),
              ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}