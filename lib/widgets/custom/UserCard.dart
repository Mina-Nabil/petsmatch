import 'package:flutter/material.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/PetMatchRating.dart';

class UserCard extends StatelessWidget {
  Profile _profile;

  UserCard(this._profile);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 89,
      padding: EdgeInsets.all(PetsTheme.getLargePadMarg()),
      color: PetsTheme.commentBgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: CircleAvatar(
                radius: PetsTheme.radius3,
                backgroundImage: Image.network(_profile.image).image,
              )),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg()),
              alignment: Alignment.topLeft,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(child: Text(_profile.name, style: TextStyle(color: PetsTheme.blackTextColor))),
                  FittedBox(child: Text(_profile.whoIAm(), style: TextStyle(color: PetsTheme.petsHintGrayColor))),
                  Container(
                      width: 120,
                      height: 28,
                      child: PetMatchRating(
                          rate: _profile.rating,
                          size: PetsTheme.getMeduimFont(),
                          ratedColor: PetsTheme.petsHintGrayColor,
                          unratedColor: PetsTheme.petsHintGrayColor))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
