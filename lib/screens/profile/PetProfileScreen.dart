import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/posts/PetProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import '../../providers/api_providers/pet_provider.dart';
import '../../providers/api_providers/user_provider.dart';
import 'package:provider/provider.dart';

class PetProfileScreen extends StatelessWidget {
  PetProvider petProvider;
  UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    petProvider = Provider.of<PetProvider>(context);
    petProvider.getAPet('1', token: userProvider.user.token);

    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: PetProfileCover(),
      bodyWidgets: [
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
