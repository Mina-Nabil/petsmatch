import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';
import 'package:petmatch/widgets/feed/SuggestionsIconsList.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostProvider postProvider;
  UserProvider userProvider;

  List<RegularPost> posts;
  List<Widget> postWidgets;

  User mainUser;
  List<Profile> suggests;
  List<Pet> pets;

  int status;
  bool done = false;
  // UserProvider _userProvider;
  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    postProvider = Provider.of<PostProvider>(context, listen: false);

    print("suggests 1");
    super.initState();
    mainUser = userProvider.user;
    Future.delayed(Duration.zero).then((value) => updatePosts());

    postWidgets = [
      NewPostWidget(),
      // SuggesionsIconsList([
      // SuggestedIcon(mainUser),
      // ...pets.map((element) {
      //   return SuggestedIcon(element);
      // })
      // ]),
    ];
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://www.cesarsway.com/wp-content/uploads/2019/10/AdobeStock_190562703.jpeg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://i.insider.com/5efe3d7faee6a8324a656478?width=1100&format=jpeg&auto=webp",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image: "https://scx2.b-cdn.net/gfx/news/hires/2018/2-dog.jpg",
    //       owner: "Mina"),
    //   Pet(
    //       name: "Bobby",
    //       image:
    //           "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",
    //       owner: "Mina"),
    // ];
    // mainUser.addAllPet(pets);
    print(suggests);
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
          postWidgets.addAll(posts.map((post) {
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                        onTap: () => Navigator.of(context).pushNamed('profile'),
                      ),
                      Container(
                          height: 55,
                          width: 55,
                          child: GestureDetector(
                            child: CircularPetButton(
                                PetsTheme.currentMainColor.withOpacity(.2),
                                Paths.search_icon_path,
                                Colors.white),
                            onTap: () =>
                                Navigator.of(context).pushNamed('search'),
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
        bodyWidgets: postWidgets
        // [
        //   NewPostWidget(),
        //   SuggesionsIconsList([
        //     SuggestedIcon(mainUser),
        //     ...pets.map((element) {
        //       return SuggestedIcon(element);
        //     })
        //   ]),
        //   if (done)
        //     ...posts.map((post) {
        //       return RegularPostWidget(
        //         post,
        //         margin:
        //             EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
        //         contentPadding: EdgeInsets.only(
        //             left: PetsTheme.getMuchLargerPadMarg(),
        //             right: PetsTheme.getMuchLargerPadMarg(),
        //             bottom: PetsTheme.getLargePadMarg()),
        //       );
        //     }).toList(),
        // ],
        );
  }
}
