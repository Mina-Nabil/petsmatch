import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/profile/widgets/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class ProfileScreen extends StatelessWidget {


    

  @override
  Widget build(BuildContext context) {
    

    return PetMatchSingleScreen(
      backArrow: true,
      scrollableHeader: true,
      header: ProfileCover(),
      body: Column(
        children: [
          NewPostWidget(),
          ...posts.map(
              (post) {
                return RegularPostWidget(
                  post,
                  margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
                  contentPadding: EdgeInsets.only(left: PetsTheme.getMuchLargerPadMarg(), right: PetsTheme.getMuchLargerPadMarg(), bottom: PetsTheme.getLargePadMarg()),
                );
              }
            ).toList(),

        ],
      ),
    );
      }
}