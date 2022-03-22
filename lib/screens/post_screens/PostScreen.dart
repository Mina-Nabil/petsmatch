import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/comment_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
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

List<Widget> commentsWidget = [];
List<Comment> comments;
PostProvider postProvider;
CommentProvider commentProvider;
UserProvider userProvider;
Post _post;
// List<ClassComment> _comments;

class _SearchScreen extends State<PostScreen> {
  final TextEditingController _commentController = new TextEditingController();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void addComment() async {
    await commentProvider.addComment(_commentController.text.trim(),
            postProvider.post.id.toString(), userProvider.user.token)
        ? setState(() {
            commentProvider.addCommentToList(new Comment(
                owner: userProvider.user,
                imageUrl: userProvider.user.image,
                text: _commentController.text.trim()));
            comments = commentProvider.comments;
            _commentController.clear();
          })
        : false;
  }

  void getComments() async {
    int status = await commentProvider.getComment(postID: _post.id.toString());
    setState(() {
      if (status >= 200 && status < 300) {
        comments = commentProvider.comments;
        commentsWidget.addAll(comments.map((e) {
          return Comment(
            owner: e.owner,
            text: e.text,
            imageUrl: e.imageUrl,
            margin: EdgeInsets.symmetric(
                vertical: PetsTheme.getSmallestPadMarg(),
                horizontal: PetsTheme.getLargerPadMarg()),
            padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
          );
        }).toList());
      }
    });
  }

  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    postProvider = Provider.of<PostProvider>(context, listen: false);
    commentProvider = Provider.of<CommentProvider>(context, listen: false);
    _post = postProvider.post;
    commentsWidget = [];
    commentsWidget.add(
      RegularPostWidget(
        _post,
        contentPadding: EdgeInsets.only(
            left: PetsTheme.getLargerPadMarg(),
            right: PetsTheme.getLargerPadMarg(),
            bottom: PetsTheme.getLargerPadMarg()),
        enableCommentButton: false,
      ),
    );
    firebaseCloudMessaging_Listeners();

    Future.delayed(Duration.zero).then((value) => getComments());
    super.initState();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("notification reecieved");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                Column(
                  children: comments.map((e) {
                    return Comment(
                      owner: e.owner,
                      text: e.text,
                      imageUrl: e.imageUrl,
                      margin: EdgeInsets.symmetric(
                          vertical: PetsTheme.getSmallestPadMarg(),
                          horizontal: PetsTheme.getLargerPadMarg()),
                      padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                    );
                  }).toList(),
                )
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
                      controller: _commentController,
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
                        addComment();
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
    @required this.owner,
    @required this.imageUrl,
    @required this.text,
  });

  final User owner;
  final String imageUrl;
  final String text;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  factory Comment.fromJson(Map<String, dynamic> parsedJson) {
    User user = User.fromSearchJson(parsedJson['user']);
    return Comment(
      owner: user,
      imageUrl: user.image,
      text: parsedJson["content"],
    );
  }
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
