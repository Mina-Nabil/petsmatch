import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/screens/main_screen/main_tabs/HomeScreen.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/main/SizedCircularIconButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';
import '../../providers/api_providers/user_provider.dart';

class NewPostWidget extends StatelessWidget {
  final double maxHeightRatio = .2;
  final double minHeightRatio = .12;
  PostProvider postProvider;
  UserProvider userProvider;
  User user;
  // const NewPostWidget({this.updatePost});
  final TextEditingController _postController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    postProvider = Provider.of<PostProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    user = userProvider.user;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * minHeightRatio,
            maxHeight: MediaQuery.of(context).size.height * maxHeightRatio),
        padding: EdgeInsets.symmetric(
            horizontal: PetsTheme.getLargerPadMarg(),
            vertical: PetsTheme.getMeduimPadMarg()),
        margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding:
                  EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(
                              right: PetsTheme.getLargePadMarg()),
                          child: UserAvatar(
                              image:
                                  "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",
                              imageRatio: .2))),
                  Flexible(
                    flex: 6,
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Share your thoughts...",
                            hintStyle: TextStyle(fontFamily: "Roboto"),
                            border: InputBorder.none),
                        controller: _postController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsRedColor,
                    bgColor: PetsTheme.petsRedBg,
                    iconPath: Paths.video_icon_svg,
                    buttonCallback: () {},
                  ),
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsGreenColor,
                    bgColor: PetsTheme.petsGreenBg,
                    iconPath: Paths.gallery_icon_svg,
                    buttonCallback: null,
                  ),
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsBlueColor,
                    bgColor: PetsTheme.petsBlueBg,
                    iconPath: Paths.location_icon_svg,
                    buttonCallback: null,
                  ),
                ],
              ),
            ),
            SubmitButton(
              // callBackFunction: () => Navigator.of(context).push(
              //     new PageTransition(
              //         child: SetUserPhotoScreen(),
              //         type: PageTransitionType.fade)),
              callBackFunction: () async {
                PostOwner po = new UserPostOwner(
                    id: user.id, name: user.name, imageUrl: user.image);
                print(_postController.text.trim());
                RegularPost post = new RegularPost(
                    owner: po,
                    postDate: new DateTime.now(),
                    commentsCount: 0,
                    lovesCount: 0,
                    isLoved: false,
                    image: "",
                    text: _postController.text.trim());
                print(context);
                int status = await postProvider.createPost(
                    post, userProvider.user.token);
                if (status == 200) {
                  postProvider.posts.add(post);
                }
              },
              buttonText: "Post",
              isShowPaws: false,
            ),
          ],
        ));
  }
}
