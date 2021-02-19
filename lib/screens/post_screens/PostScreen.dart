import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';
import 'package:petmatch/widgets/screens/PetMatchScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';


class PostScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<PostScreen> {

  Post _post = RegularPost(
  owner: UserPostOwner(id: 2, name:"Yasmine", imageUrl: "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg", pets: ["Coco"]), 
  commentsCount: 55, 
  lovesCount: 1, 
  sharesCount: 21, 
  postDate: DateTime.now().subtract(new Duration(hours: 2)),
  isLoved: true,
  image: "https://i2-prod.mirror.co.uk/incoming/article8596219.ece/ALTERNATES/s615/1_Sad-dog.jpg",
  text: "Depressed, Please pray for him ...",
);

  @override
  Widget build(BuildContext context) {
    return PetMatchScreen(
      body: PetMatchContainer(
        headerPadding: EdgeInsets.zero,
        bodyPadding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        bodyBackgroundColor: Colors.white,
        body: Column(
          children:[
            Expanded(
              child: ListView(
                children: [
                  RegularPostWidget(
                    _post, 
                    contentPadding: EdgeInsets.only(left: PetsTheme.getLargerPadMarg(), right: PetsTheme.getLargerPadMarg(), bottom: PetsTheme.getLargerPadMarg()),
                    enableCommentButton: false,
                  ),
                  Comment(
                    text: "This is a comment area", 
                    imageUrl: "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                    margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallestPadMarg(), horizontal: PetsTheme.getLargerPadMarg()),
                    padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                  ),

                  Comment(
                    text: "This is another comment", 
                    imageUrl: "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                    margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallestPadMarg(), horizontal: PetsTheme.getLargerPadMarg()),
                    padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                  ),

                  Comment(
                    text: "This is another comment", 
                    imageUrl: "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
                    margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallestPadMarg(), horizontal: PetsTheme.getLargerPadMarg()),
                    padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(horizontal: PetsTheme.getLargerPadMarg(), vertical: PetsTheme.getSmallPadMarg()),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Write a message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide( width: 0,style: BorderStyle.none,),
                            ),
                          ),
                        ),
                    ),

                    SizedBox(width: PetsTheme.getLargePadMarg(),),

                    FittedBox(
                      child: GestureDetector(
                        child: Icon(Icons.send, color: PetsTheme.currentBgMainColor,),
                        onTap:  () {
                          print("add comment");
                        } ,
                      ),
                    ),
                  ],
                ))
          ]
        )
        
    ));
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
        borderRadius: const BorderRadius.only(topRight: const Radius.circular(10.0),bottomLeft: const Radius.circular(10.0), bottomRight: const Radius.circular(10.0))),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            child: UserAvatar(image: imageUrl, imageRatio: 1,)
          ),
          SizedBox(width: PetsTheme.getMeduimPadMarg(),),
          Text(text ,style: TextStyle(color: PetsTheme.blackTextColor, fontSize: PetsTheme.getVerySmallFont()),),
        ],
      ),
    );
  }
}
