import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/posts/AboutPost.dart';
import 'package:petmatch/widgets/posts/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';
import '../../providers/api_providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    userProvider.getUserData(token: userProvider.user.token);
    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: ProfileCover(),
      bodyWidgets: [
        if (PetsTheme.accountType == AccountType.vet ||
            PetsTheme.accountType == AccountType.store)
          AboutPost(
            phoneNo: userProvider.user.phone,
            address: userProvider.user.city,
            website: "www.vetpoint.com",
            mail: userProvider.user.email,
            workingHours: "10:00 am - 10:00 pm",
          ),
        SizedBox(
          height: PetsTheme.getMeduimPadMarg() * 2,
        ),
        NewPostWidget(),
        ...posts.map((post) {
          return RegularPostWidget(
            post,
            margin:
                EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
            contentPadding: EdgeInsets.only(
                left: PetsTheme.getMuchLargerPadMarg(),
                right: PetsTheme.getMuchLargerPadMarg(),
                bottom: PetsTheme.getLargePadMarg()),
          );
        }).toList(),
      ],
    );
  }
}
