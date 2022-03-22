import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostProvider postProvider;
  PetProvider petProvider;
  UserProvider userProvider;

  List<RegularPost> posts;
  List<Widget> postWidgets;

  User mainUser;
  List<Profile> suggests;
  List<Pet> pets;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  int status;
  bool done = false;
  // UserProvider _userProvider;

  void updatePets() async {
    /* whatever */

    userProvider = Provider.of<UserProvider>(context, listen: false);
    petProvider = Provider.of<PetProvider>(context, listen: false);

    status = await petProvider.showMyPets(token: userProvider.user.token);
    print("{$status} is my pet status");
  }

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    postProvider = Provider.of<PostProvider>(context, listen: false);
    firebaseCloudMessaging_Listeners();

    print("suggests 1");
    super.initState();
    mainUser = userProvider.user;
    Future.delayed(Duration.zero).then((value) => updatePosts());

    postWidgets = [
      NewPostWidget(
        onNewPost: (RegularPost post) {
          print(post);
          setState(() {
            postWidgets.add(RegularPostWidget(
              post,
              margin:
                  EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
              contentPadding: EdgeInsets.only(
                  left: PetsTheme.getMuchLargerPadMarg(),
                  right: PetsTheme.getMuchLargerPadMarg(),
                  bottom: PetsTheme.getLargePadMarg()),
            ));
          });
        },
      ),
    ];
    print(suggests);

    updatePets();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("notification reecieved");
      },
    );
  }

  void updatePosts() async {
    print(userProvider.user.token);
    status = await postProvider.getNewsFeed(userProvider.user.token);
    print('${status} these are the status');
    if (status == 200) {
      posts = postProvider.posts;
      print('${posts} these are the posts');

      setState(() {
        done = true;
        print(posts[0].commentsCount);
        if (done)
          // Consumer<PostProvider>(builder: (context, postProvider, child) {
          //   setState(() {
          postWidgets.addAll(postProvider.posts.map((post) {
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
        //   });
        // });
      });
    }
  }

  // later PostProvider

  @override
  Widget build(BuildContext context) {
    List<Widget> petImages = [];
    if (mainUser.pets.length > 0) {
      mainUser.pets.forEach((element) {
        petImages.add(Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()),
            child: UserAvatar(image: element.image, imageRatio: 1)));
      });
    }

    return PetMatchSingleScreen.scrollable(
      //scrollableHeader: true,
      header: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: UserAvatar(
                        image: mainUser.image == null
                            ? "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg"
                            : mainUser.image,
                        imageRatio: 1),
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                    'profile',
                    arguments: <String, dynamic>{
                      'data': mainUser,
                    },
                  ),
                ),
                Container(
                    height: 55,
                    width: 55,
                    child: GestureDetector(
                      child: CircularPetButton(
                          PetsTheme.currentMainColor.withOpacity(.2),
                          Paths.search_icon_path,
                          Colors.white),
                      onTap: () => Navigator.of(context).pushNamed('search'),
                    ))
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: petImages,
                  ),
                ),
              )
            ]),
      ),
      bodyWidgets: postWidgets,
    );
  }
}
