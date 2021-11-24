import 'dart:ui';

import 'package:petmatch/models/Comment.dart' as ClassComment;
import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:provider/provider.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';

class PostScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

PostProvider postProvider;
// List<ClassComment> _comments;

class _SearchScreen extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    postProvider = Provider.of<PostProvider>(context, listen: false);

    Post _post = postProvider.post;
    // _comments = postProvider.comments;
    return PetMatchSingleScreen(
        backArrow: true,
        bodyBackgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                RegularPostWidget(
                  _post,
                  contentPadding: EdgeInsets.only(
                      left: PetsTheme.getLargerPadMarg(),
                      right: PetsTheme.getLargerPadMarg(),
                      bottom: PetsTheme.getLargerPadMarg()),
                  enableCommentButton: false,
                ),
                // Comment(
                //   text: "This is a comment area",
                //   imageUrl:
                //       "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                //   margin: EdgeInsets.symmetric(
                //       vertical: PetsTheme.getSmallestPadMarg(),
                //       horizontal: PetsTheme.getLargerPadMarg()),
                //   padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                // ),
                // Comment(
                //   text: "This is another comment",
                //   imageUrl:
                //       "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                //   margin: EdgeInsets.symmetric(
                //       vertical: PetsTheme.getSmallestPadMarg(),
                //       horizontal: PetsTheme.getLargerPadMarg()),
                //   padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                // ),
                // Comment(
                //   text: "This is another comment",
                //   imageUrl:
                //       "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                //   margin: EdgeInsets.symmetric(
                //       vertical: PetsTheme.getSmallestPadMarg(),
                //       horizontal: PetsTheme.getLargerPadMarg()),
                //   padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                // ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: PetsTheme.getLargerPadMarg(),
                  vertical: PetsTheme.getSmallPadMarg()),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Write a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: PetsTheme.getLargePadMarg(),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      child: Icon(
                        Icons.send,
                        color: PetsTheme.currentBgMainColor,
                      ),
                      onTap: () {
                        print("add comment");
                      },
                    ),
                  ),
                ],
              ))
        ]));
  }
}

class Comment extends StatelessWidget {
  const Comment({
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    @required this.imageUrl,
    @required this.text,
  });

  final String imageUrl;
  final String text;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: PetsTheme.commentBgColor,
          borderRadius: const BorderRadius.only(
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0))),
      child: Row(
        children: [
          Container(
              width: 25,
              height: 25,
              child: UserAvatar(
                image: imageUrl,
                imageRatio: 1,
              )),
          SizedBox(
            width: PetsTheme.getMeduimPadMarg(),
          ),
          Text(
            text,
            style: TextStyle(
                color: PetsTheme.blackTextColor,
                fontSize: PetsTheme.getVerySmallFont()),
          ),
        ],
      ),
    );
  }
}
