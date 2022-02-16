import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
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
  final String id;
  ProfileScreen({Key key, this.id}) : super(key: key);
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProvider userProvider;

  PostProvider postProvider;

  PetProvider petProvider;

  List<RegularPost> posts;

  List<Widget> bodyWidgets;

  int status;

  User activeUser;

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
    petProvider = Provider.of<PetProvider>(context, listen: false);
    bodyWidgets = [
      AboutPost(
        phoneNo: activeUser.phone,
        address: activeUser.city,
        website: "www.vetpoint.com",
        mail: activeUser.email,
        workingHours: "10:00 am - 10:00 pm",
      ),
      SizedBox(
        height: PetsTheme.getMeduimPadMarg() * 2,
      ),
      activeUser.id == userProvider.user.id ? NewPostWidget() : Row()
    ];
    status = await postProvider
        .getPosts(activeUser == null ? userProvider.user.id : activeUser.id);
    if (status == 200) {
      posts = postProvider.posts;

      setState(() {
        done = true;
        if (done)
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
        petProvider.showMyPets(token: userProvider.user.token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    arguments == null ? false : activeUser = arguments['data'];
    print(activeUser.name);
    return PetMatchSingleScreen.scrollable(
      backArrow: true,
      //scrollableHeader: true,
      header: ProfileCover(activeUser),
      bodyWidgets: bodyWidgets,
    );
  }
}
