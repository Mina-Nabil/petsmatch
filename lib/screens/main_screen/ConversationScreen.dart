import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';


class ConversationScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<ConversationScreen> {



  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      title: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            child: UserAvatar(image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",imageRatio: 1,)),
          SizedBox(width: PetsTheme.getMeduimPadMarg(),),
          Text("Sayed",
              style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
        bodyBackgroundColor: Colors.white,

        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                children: [
                  ConversationTextTile(
                    "Hii", 
                    "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
                    ConversationType.RECEIVE),
                  ConversationTextTile(
                    "aaa yasta 3ml a?",
                    "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",
                    ConversationType.SEND,
                  ),
                  ConversationTextTile(
                    "kolo fol el7, enta 3ml?",
                    "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
                    ConversationType.RECEIVE,
                  ),
                ],
              ),
            ),
            
            Container(
              margin:EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide( width: 0,style: BorderStyle.none,),
                            ),
                            hintText: " Write a message ...",
                            hintStyle: TextStyle(color: PetsTheme.petsHintGrayColor)
                          ),
                        ),
                    ),

                    SizedBox(width: PetsTheme.getLargePadMarg(),),

                    FittedBox(
                      child: GestureDetector(
                        child: Icon(Icons.send, color: PetsTheme.currentBgMainColor,),
                        onTap:  () {
                          print("send message");
                        } ,
                      ),
                    ),
                  ],
                )),
          ],
      ),
    );
  }
}

enum ConversationType {
  SEND,
  RECEIVE
}

abstract class ConversationTextTile extends StatelessWidget {

  factory ConversationTextTile(
    String text,
    String image,
    ConversationType type
  ) {
    if(type == ConversationType.RECEIVE) {
      return ConversationTextTileReceived(text: text, image: image,);
    } else {
      return ConversationTextTileSend(text: text, image: image,);
    }
  }
}

class ConversationTextTileReceived extends StatelessWidget implements ConversationTextTile {
  
  
  const ConversationTextTileReceived({
    @required this.text,
    @required this.image,
  });

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(left: PetsTheme.getSmallestPadMarg()),
          child: UserAvatar(image: image, imageRatio: 1,)
        ),

        Expanded(
          child: Container(
            margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("02:09 PM", style: TextStyle(fontSize: PetsTheme.getVerySmallFont(),color: PetsTheme.petsHintGrayColor)),
                Container(
                  padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                  decoration: BoxDecoration(
                    color:PetsTheme.commentBgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0),
                      bottomRight:  const Radius.circular(15.0),
                    ),
                  ),
                  child: Text(text ,style: TextStyle(fontSize: PetsTheme.getMeduimFont()),),
                  

                ),
              ],
            ),
          ),
        ),
      ]);
  }
}

class ConversationTextTileSend extends StatelessWidget implements ConversationTextTile {
  
  
  const ConversationTextTileSend({
    @required this.text,
    @required this.image,
  });

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("02:09 PM", style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: PetsTheme.petsHintGrayColor)),
                  Container(
                    padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                    decoration: BoxDecoration(
                      color:PetsTheme.currentMainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        topLeft: const Radius.circular(15.0),
                        bottomRight:  const Radius.circular(15.0),
                      ),
                    ),
                    child: Text(text ,style: TextStyle(color: Colors.white, fontSize: PetsTheme.getMeduimFont()),),
                    

                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(left: PetsTheme.getSmallestPadMarg()),
            child: UserAvatar(image: image, imageRatio: 1,)
          ),
        ]),
    );
  }
}