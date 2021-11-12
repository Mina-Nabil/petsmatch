import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/posts/AboutPost.dart';
import 'package:petmatch/widgets/posts/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';
import '../../providers/api_providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProvider userProvider;

  PostProvider postProvider;

  List<RegularPost> posts;

  List<Widget> bodyWidgets;

  int status;

  bool done = false;

  @override
  // ignore: must_call_super
  void initState() {
    done = false;
    bodyWidgets = [];
    Future.delayed(Duration.zero).then((value) => updatePosts());
    super.initState();
  }

  void updatePosts() async {
    /* whatever */

    userProvider = Provider.of<UserProvider>(context, listen: false);
    postProvider = Provider.of<PostProvider>(context, listen: false);
    bodyWidgets = [
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
      NewPostWidget()
    ];
    status = await postProvider.getNewsFeed(userProvider.user.token);
    print('${status} these are the status');
    if (status == 200) {
      posts = postProvider.posts;
      print('${posts} these are the posts');

      setState(() {
        done = true;
        print(posts[0].commentsCount);
        if (done)
          bodyWidgets.addAll(posts.map((post) {
            print(post);
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
        print("${done} it is");
      });
    }
  }

  // void setState() {
  //   print("${done} it is");
  //   done = true;
  // }

  @override
  Widget build(BuildContext context) {
    // userProvider.getUserData(token: userProvider.user.token);
    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: ProfileCover(),
      bodyWidgets: bodyWidgets,
    );
  }
}
