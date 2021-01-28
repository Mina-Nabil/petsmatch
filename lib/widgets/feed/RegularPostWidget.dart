import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';

import 'package:timeago/timeago.dart' as timeago;

class RegularPostWidget extends StatefulWidget {
  
  RegularPostWidget(this.post);

  final RegularPost post;

  @override
  _RegularPostWidgetState createState() => _RegularPostWidgetState();
}

class _RegularPostWidgetState extends State<RegularPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //Image
          if(widget.post.image != null)
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width ,
                  height: 250,
                  image: NetworkImage(widget.post.image),
                  placeholder: Image.asset("assets/images/icons/main/imagePlaceholder.png",fit: BoxFit.contain,).image,
                ),
            ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: PetsTheme.getMuchLargerPadMarg()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Text
                if(widget.post.text != null)
                  Padding(
                    padding: EdgeInsets.only(top: PetsTheme.getLargerPadMarg(), bottom: PetsTheme.getSmallerPadMarg()),
                    child: Text(widget.post.text, style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                  ),

                // DateTime
                Padding(
                  padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallerPadMarg()),
                  child: Text(timeago.format(widget.post.postDate), style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: Colors.grey),),
                ),

                Divider(height: 10,),

                //Owner Section
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
                      child: UserAvatar(image: widget.post.owner.imageUrl,imageRatio: 1,)
                    ),
                    SizedBox(width: PetsTheme.getMeduimPadMarg(),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.post.owner.name, style: TextStyle(fontSize: PetsTheme.getMeduimFont() ,fontWeight: FontWeight.bold),),
                        Text(widget.post.owner.whoIAm(),style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: Colors.grey)),
                      ],
                    )
                  ],
                ),

                // love & commnets section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    // love commnet, share icons
                    Row(
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset(
                            "assets/images/icons/love.svg",
                            color: widget.post.isLoved? Colors.pink : Colors.grey, 
                            width: PetsTheme.smallIconSize(), height: PetsTheme.smallIconSize() ,
                          ),
                          onTap: () {
                            setState(() {
                              widget.post.toggleLove();
                            });
                            //TODO should update backend with this toggle
                          },
                        ),
                        SizedBox(width: PetsTheme.getLargePadMarg(),),
                        SvgPicture.asset("assets/images/icons/comment.svg",color: Colors.grey, width: PetsTheme.smallIconSize(), height: PetsTheme.smallIconSize() ,),
                        SizedBox(width: PetsTheme.getLargePadMarg(),),
                        SvgPicture.asset("assets/images/icons/share.svg",color: Colors.grey, width: PetsTheme.smallIconSize(), height: PetsTheme.smallIconSize() ,),
                      ],
                    ),

                    // love commnet, share count
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("${widget.post.lovesCount}", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                            Text("Love", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                          ],
                        ),
                        SizedBox(width: PetsTheme.getLargePadMarg(),),
                        Column(
                          children: [
                            Text("${widget.post.commentsCount}", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                            Text("Comments", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                          ],
                        ),
                        SizedBox(width: PetsTheme.getLargePadMarg(),),
                        Column(
                          children: [
                            Text("${widget.post.sharesCount}", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                            Text("Shares", style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                          ],
                        ),
                      ],
                     )
                  ],
                ),
                
                

                //Comments
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: PetsTheme.getMuchLargerPadMarg()),
                    padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                    decoration: BoxDecoration(
                      color: PetsTheme.commentBgColor,
                      borderRadius: const BorderRadius.only(topRight: const Radius.circular(10.0),bottomLeft: const Radius.circular(10.0), bottomRight: const Radius.circular(10.0))),
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          child: UserAvatar(image: widget.post.owner.imageUrl,imageRatio: 1,)
                        ),
                        SizedBox(width: PetsTheme.getMeduimPadMarg(),),
                        Text("Leave a comment" ,style: TextStyle(color: PetsTheme.petsHintGrayColor, fontSize: PetsTheme.getVerySmallFont()),),
                      ],
                    ),
                  ),
                  onTap: () {print("Open comments screen and focus on new comment");},
                ),
                
              ],
            ),
          ),
          
        ],
      ),
      
    );
  }
}