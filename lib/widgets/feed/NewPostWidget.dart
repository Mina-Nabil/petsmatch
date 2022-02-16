import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RemoveImageButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/main/SizedCircularIconButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';
import '../../providers/api_providers/user_provider.dart';

class NewPostWidget extends StatefulWidget {
  const NewPostWidget({this.onNewPost});

  final NewPostCallBack onNewPost;

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState(onNewPost);
}

typedef NewPostCallBack = void Function(RegularPost post);

class _NewPostWidgetState extends State<NewPostWidget> {
  _NewPostWidgetState(this._onNewPost);

  NewPostCallBack _onNewPost;

  final double maxHeightRatio = .2;

  final double minHeightRatio = .12;

  PostProvider postProvider;

  UserProvider userProvider;

  User user;

  final TextEditingController _postController = new TextEditingController();

  String postImage = "";
  void addpost() async {
    PostOwner po =
        new UserPostOwner(id: user.id, name: user.name, imageUrl: user.image);

    RegularPost post = new RegularPost(
        owner: po,
        postDate: new DateTime.now(),
        commentsCount: 0,
        lovesCount: 0,
        isLoved: false,
        image: postImage,
        text: _postController.text.trim());
    int status = await postProvider.createPost(post, userProvider.user.token);
    if (status >= 200 && status < 300) {
      _postController.clear();
      postProvider.posts.add(post);
      _onNewPost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * 0.8;

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
                              image: userProvider.user.image, imageRatio: .2))),
                  Flexible(
                    flex: 6,
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Share your thoughts...",
                            hintStyle: TextStyle(fontFamily: "Roboto"),
                            border: InputBorder.none),
                        controller: _postController,
                      ),
                    ]),
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
                  postImage == ""
                      ? SizedCircularIconButton(
                          iconColor: PetsTheme.petsGreenColor,
                          bgColor: PetsTheme.petsGreenBg,
                          iconPath: Paths.gallery_icon_svg,
                          buttonCallback: () async {
                            final ImagePicker _picker = ImagePicker();
                            final pickedFile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              fieldsWidth = 20;
                              postImage = pickedFile.path.toString();
                            });
                          },
                        )
                      : Row(children: [
                          RemoveImageButton(
                              fieldsWidth: fieldsWidth - 160,
                              callBackFunction: () async {
                                setState(() {
                                  postImage = "";
                                });
                              }),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: FileImage(File(postImage)),
                          )
                          // RemoveImageButton(
                          //     fieldsWidth: 13,
                          //     callBackFunction: () async {
                          //       setState(() {
                          //         postImage = null;
                          //       });
                          //     })
                        ]),
                ],
              ),
            ),
            SubmitButton(
              fieldsWidth: fieldsWidth,
              // callBackFunction: () => Navigator.of(context).push(
              //     new PageTransition(
              //         child: SetUserPhotoScreen(),
              //         type: PageTransitionType.fade)),
              callBackFunction: () async {
                Future.delayed(Duration.zero).then((value) => addpost());
              },
              buttonText: "Post",
              isShowPaws: false,
            ),
          ],
        ));
  }
}
