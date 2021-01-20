import 'package:flutter/material.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';

class SuggestedIcon extends StatelessWidget {

  final double height;
  final Profile profile;
  SuggestedIcon( this.profile, {this.height=320});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(right: PetsTheme.getLargestPadMarg()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Flexible( 
            flex: 4, 
            child: Container( 
              alignment: Alignment.center,
              child: UserAvatar(image: profile.image, imageRatio: .5,),
            )
          ), 
          Flexible(
            flex:1,
            child: FittedBox(child: Center(child: Text(profile.name))) 
          ) ,
          Flexible(
            flex:1,
            child: FittedBox(child: Center(child: Text("Follow", style: TextStyle(color: PetsTheme.petsBlueColor),))) 
          )
        ],),
    );
  }
}