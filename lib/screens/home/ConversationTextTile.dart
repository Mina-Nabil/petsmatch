import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';


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