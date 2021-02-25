import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';
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
      
      body: PetMatchContainer(
        headerPadding: EdgeInsets.zero,
        bodyPadding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        bodyBackgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ConversationTextTile(
                    text: "Hii", 
                    image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
                    type: ConversationTextType.RECEIVE),
                  ConversationTextTile(
                    image: "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",
                    text: "aaa yasta 3ml a?",
                    type: ConversationTextType.SEND,
                  ),
                  ConversationTextTile(
                    image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
                    text: "kolo fol el7, enta 3ml a?",
                    type: ConversationTextType.RECEIVE,
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
        )
      ),
    );
  }
}

enum ConversationTextType {
  SEND,
  RECEIVE
}

class ConversationTextTile extends StatelessWidget {
  
  
  const ConversationTextTile({
    @required this.text,
    @required this.image,
    @required this.type
  });

  final String image;
  final String text;
  final ConversationTextType type;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: type == ConversationTextType.RECEIVE? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
        padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
        decoration: type == ConversationTextType.RECEIVE ? 
        BoxDecoration(
          color:Colors.grey[300],
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(35.0),
            topRight: const Radius.circular(20.0),
            bottomRight:  const Radius.circular(20.0),
          )
        )
        : BoxDecoration(
          color: PetsTheme.commentBgColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20.0),
            bottomLeft: const Radius.circular(20.0),
            topRight: const Radius.circular(35.0),
            bottomRight: Radius.zero
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if(type == ConversationTextType.RECEIVE)
            Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.only(left: PetsTheme.getSmallestPadMarg()),
              child: UserAvatar(image: image, imageRatio: 1,)
            ),
            SizedBox(width: PetsTheme.getMeduimPadMarg(),),
            Flexible(
              child: Text(text ,style: TextStyle(fontSize: PetsTheme.getMeduimFont()),),
            ),
            SizedBox(width: PetsTheme.getMeduimPadMarg(),),
          ],
        ),
      ),
    );
  }
}