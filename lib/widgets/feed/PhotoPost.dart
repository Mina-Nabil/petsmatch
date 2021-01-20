import 'package:flutter/material.dart';
import 'package:petmatch/models/ImagePost.dart';

class PhotoPost extends StatefulWidget {

  final ImagePost imagePost;

  PhotoPost(this.imagePost);

  @override
  _PhotoPostState createState() => _PhotoPostState();
}

class _PhotoPostState extends State<PhotoPost> {
  //Widget Dimentions
  final double borderRaduis=20;
  final double postHeight=566;
  final double imageHeight=250;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRaduis),),
      height: postHeight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InPostImage(widget.imagePost.imageURL, imageHeight),
        ],),
      );
  }
}


class InPostImage extends StatelessWidget {

  final height;
  final imageURL;

  InPostImage(this.imageURL, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: FadeInImage(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width ,
              height: height,
              image: NetworkImage(imageURL),
              placeholder: AssetImage("assets/images/icons/main/userPlaceholder.png"),
            ),
    );
  }
}