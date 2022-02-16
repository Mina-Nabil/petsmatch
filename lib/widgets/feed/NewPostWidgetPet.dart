import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RemoveImageButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/buttons/UploadImageButton.dart';
import 'package:petmatch/widgets/main/SizedCircularIconButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';
import '../../providers/api_providers/user_provider.dart';

class NewPostWidgetPet extends StatefulWidget {
  const NewPostWidgetPet({this.onNewPost});

  final NewPostCallBack onNewPost;

  @override
  State<NewPostWidgetPet> createState() => _NewPostWidgetPetState(onNewPost);
}

typedef NewPostCallBack = void Function(RegularPost post);

class _NewPostWidgetPetState extends State<NewPostWidgetPet> {
  _NewPostWidgetPetState(this._onNewPost);

  NewPostCallBack _onNewPost;

  final double maxHeightRatio = .2;

  final double minHeightRatio = .12;

  PostProvider postProvider;

  PetProvider petProvider;

  String postImage = "";

  Pet pet;

  final TextEditingController _postController = new TextEditingController();

  void addpost() async {
    PostOwner po =
        new PetPostOwner(id: pet.id, name: pet.name, imageUrl: pet.image);

    RegularPost post = new RegularPost(
        owner: po,
        postDate: new DateTime.now(),
        commentsCount: 0,
        lovesCount: 0,
        isLoved: false,
        image: postImage,
        text: _postController.text.trim());
    int status = await postProvider.createPetPost(post, po.id);
    if (status >= 200 && status < 300) {
      postImage = "";
      _postController.text = "";
      postProvider.posts.add(post);
      _onNewPost(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * 0.8;
    final int imageWidth = MediaQuery.of(context).size.width.toInt();
    final int imageHeight = 150;
    postProvider = Provider.of<PostProvider>(context);
    petProvider = Provider.of<PetProvider>(context);
    pet = petProvider.selectedPet;
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
                              image: petProvider.selectedPet.image,
                              imageRatio: .2))),
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
