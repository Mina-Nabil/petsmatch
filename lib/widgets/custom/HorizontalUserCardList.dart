import 'package:flutter/material.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/UserCard.dart';

class HorizontalUserCardList extends StatelessWidget {
  HorizontalUserCardList(
    this.title,
    this.profiles,
  );
  final List<Profile> profiles;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: PetsTheme.getLargePadMarg(), bottom: PetsTheme.getLargePadMarg(), left: PetsTheme.getLargestPadMarg()),
        margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(PetsTheme.radius2))),
        height: 150 + PetsTheme.getLargerPadMarg() * 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Text(
                  this.title,
                  style: TextStyle(color: PetsTheme.blackTextColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...profiles.map((profile) => Padding(
                        padding: EdgeInsets.only(bottom: PetsTheme.getLargestPadMarg(), right: PetsTheme.getMeduimPadMarg()),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(PetsTheme.radius1)),
                          child: UserCard(profile),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
