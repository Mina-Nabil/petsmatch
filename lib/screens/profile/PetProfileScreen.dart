import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/NewPostWidgetPet.dart';
import 'package:petmatch/widgets/posts/PetProfileCover.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import '../../providers/api_providers/user_provider.dart';
import 'package:provider/provider.dart';

class PetProfileScreen extends StatefulWidget {
  @override
  State<PetProfileScreen> createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  UserProvider userProvider;

  PostProvider postProvider;

  PetProvider petProvider;

  List<RegularPost> posts;

  List<Widget> bodyWidgets;

  bool isLoading = true;
  void initState() {
    bodyWidgets = [];
    Future.delayed(Duration.zero).then((value) => updatePosts());
    super.initState();
  }

  void updatePosts() async {
    /* whatever */

    userProvider = Provider.of<UserProvider>(context, listen: false);
    postProvider = Provider.of<PostProvider>(context, listen: false);
    petProvider = Provider.of<PetProvider>(context, listen: false);

    bodyWidgets = [
      NewPostWidgetPet(),
    ];
    int status = await postProvider.getPetsFeed(petProvider.selectedPet);

    if (status == 200) {
      posts = postProvider.postsPet;
      print(posts);
      setState(() {
        isLoading = true;
        if (isLoading)
          bodyWidgets.addAll(posts.map((post) {
            return RegularPostWidget(
              post,
              margin:
                  EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
              contentPadding: EdgeInsets.only(
                  left: PetsTheme.getMuchLargerPadMarg(),
                  right: PetsTheme.getMuchLargerPadMarg(),
                  bottom: PetsTheme.getLargePadMarg()),
            );
          }).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: PetProfileCover(),
      bodyWidgets: bodyWidgets,
    );
  }
}
