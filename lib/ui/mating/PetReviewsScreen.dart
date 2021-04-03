import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/PetMatchRating.dart';
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
        children: [
          Container(child: Placeholder(), height: 100,),
          Container(child: Placeholder(), height: 100,),
          Container(child: Placeholder(), height: 100,),
        ],
      ),
    );
  }
}