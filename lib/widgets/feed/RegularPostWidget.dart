import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/post_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:timeago/timeago.dart' as timeago;

import '../../global.dart';

class RegularPostWidget extends StatefulWidget {
  RegularPostWidget(this.post,
      {this.contentPadding = EdgeInsets.zero,
      this.margin = EdgeInsets.zero,
      this.enableCommentButton = true});

  final RegularPost post;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry margin;
  final bool enableCommentButton;
  @override
  _RegularPostWidgetState createState() => _RegularPostWidgetState();
}

class _RegularPostWidgetState extends State<RegularPostWidget> {
  PostProvider postProvider;
  UserProvider userProvider;
  void likePost() async {
    await postProvider.lovePost(widget.post.id, userProvider.user.token);
  }

  @override
  Widget build(BuildContext context) {
    postProvider = Provider.of<PostProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    final int imageWidth = MediaQuery.of(context).size.width.toInt();
    final int imageHeight = 250;

    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          if (widget.post.image != null)
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: FadeInImage(
                fit: BoxFit.cover,
                width: imageWidth.toDouble(),
                height: imageHeight.toDouble(),
                image: Image.network(
                  widget.post.image,
                  width: imageWidth.toDouble(),
                  cacheWidth: imageWidth,
                  height: imageHeight.toDouble(),
                  cacheHeight: imageHeight,
                ).image,
                placeholder: Image.asset(
                  "assets/images/icons/main/imagePlaceholder.png",
                  fit: BoxFit.contain,
                ).image,
              ),
            ),

          Padding(
            padding: widget.contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text
                if (widget.post.text != null)
                  Padding(
                    padding: EdgeInsets.only(
                        top: PetsTheme.getLargerPadMarg(),
                        bottom: PetsTheme.getSmallerPadMarg()),
                    child: ReadMoreText(
                      widget.post.text,
                      style: TextStyle(fontSize: PetsTheme.getSmallFont()),
                      trimLength: widget.post.image != null ? 150 : 300,
                    ),
                  ),

                // DateTime
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: PetsTheme.getSmallerPadMarg()),
                  child: Text(
                    timeago.format(widget.post.postDate),
                    style: TextStyle(
                        fontSize: PetsTheme.getVerySmallFont(),
                        color: Colors.grey),
                  ),
                ),

                Divider(
                  height: 10,
                ),

                //Owner Section
                Row(
                  children: [
                    Container(
                        width: 45,
                        height: 45,
                        margin: EdgeInsets.symmetric(
                            vertical: PetsTheme.getMeduimPadMarg()),
                        child: UserAvatar(
                          image: widget.post.owner.imageUrl,
                          imageRatio: 1,
                        )),
                    Container(
                        margin: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                        child: UserNameRole(
                            name: widget.post.owner.name,
                            role: widget.post.owner.whoIAm())),
                  ],
                ),

                // love & commnets section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // love commnet, share icons
                    Row(
                      children: [
                        FlatButton(
                          padding: EdgeInsets.only(
                              right: PetsTheme.getMeduimPadMarg()),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          minWidth: 1,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: SvgPicture.asset(
                            "assets/images/icons/love.svg",
                            color:
                                widget.post.isLoved ? Colors.pink : Colors.grey,
                            width: PetsTheme.smallIconSize(),
                            height: PetsTheme.smallIconSize(),
                          ),
                          onPressed: () {
                            likePost();
                            setState(() {
                              widget.post.toggleLove();
                            });
                            //TODO should update backend with this toggle
                          },
                        ),
                        FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: PetsTheme.getMeduimPadMarg()),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            minWidth: 1,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () async {
                              RegularPost activePost = widget.post;
                              postProvider.setPost(activePost);
                              Navigator.of(context).pushNamed('post');
                            },
                            child: SvgPicture.asset(
                              "assets/images/icons/comment.svg",
                              color: Colors.grey,
                              width: PetsTheme.smallIconSize(),
                              height: PetsTheme.smallIconSize(),
                            )),
                        FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: PetsTheme.getMeduimPadMarg()),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            minWidth: 1,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {},
                            child: SvgPicture.asset(
                              "assets/images/icons/share.svg",
                              color: Colors.grey,
                              width: PetsTheme.smallIconSize(),
                              height: PetsTheme.smallIconSize(),
                            )),
                      ],
                    ),

                    // love commnet, share count
                    Row(
                      children: [
                        GestureDetector(
                          child: Column(
                            children: [
                              Text(
                                "${widget.post.lovesCount}",
                                style: TextStyle(
                                    fontSize: PetsTheme.getSmallFont()),
                              ),
                              Text(
                                "Love",
                                style: TextStyle(
                                    fontSize: PetsTheme.getSmallFont()),
                              ),
                            ],
                          ),
                          onTap: () =>
                              Navigator.of(context).pushNamed('lovers'),
                        ),
                        SizedBox(
                          width: PetsTheme.getLargePadMarg(),
                        ),
                        GestureDetector(
                          child: Column(
                            children: [
                              Text(
                                "${widget.post.commentsCount}",
                                style: TextStyle(
                                    fontSize: PetsTheme.getSmallFont()),
                              ),
                              Text(
                                "Comments",
                                style: TextStyle(
                                    fontSize: PetsTheme.getSmallFont()),
                              ),
                            ],
                          ),
                          onTap: () => widget.enableCommentButton
                              ? Navigator.of(context).pushNamed('post')
                              : null,
                        ),
                      ],
                    )
                  ],
                ),

                //Comments
                /*  GestureDetector(
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
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
