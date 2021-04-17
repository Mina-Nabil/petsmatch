import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/posts/AboutPost.dart';
import 'package:petmatch/widgets/posts/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class ProfileScreen extends StatelessWidget {


    

  @override
  Widget build(BuildContext context) {
    

    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: ProfileCover(),
      bodyWidgets: [
          if(PetsTheme.accountType == AccountType.vet || PetsTheme.accountType == AccountType.store)
            AboutPost(
              phoneNo: "012124578", 
              address: "185 Anwar el mofty", 
              website: "www.vetpoint.com", 
              mail: "vetpoint@vetpoint.com", 
              workingHours: "10:00 am - 10:00 pm",
            ),

          SizedBox(height: PetsTheme.getMeduimPadMarg()*2,),
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
    );
      }
}