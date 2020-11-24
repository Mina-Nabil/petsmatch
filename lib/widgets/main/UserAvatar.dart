import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
final String image;
final double imageRatio;

  const UserAvatar({
    this.image,
    this.imageRatio
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: ClipOval(
            child: FittedBox(
                child: FadeInImage(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * imageRatio,
              height: MediaQuery.of(context).size.width * imageRatio,
              image: NetworkImage(image),
              placeholder: AssetImage("assets/images/icons/main/userPlaceholder.png"),
            )),
          ),
        ));
  }
}