import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';


class CrushTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MatingTile(
          image1: "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg",
          petName1: "Roy",
          image2: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg",
          petName2: "Bella",
          trailing: CircularButton(
            child: SvgPicture.asset("assets/images/icons/setupDate.svg"),
            backgroundColor: PetsTheme.currentMainColor.withOpacity(0.2),
            onPressed: () {},
            radius: PetsTheme.radius2,
          ),
        ),

        Divider(thickness: 1,),

        MatingTile(
          image1: "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg",
          petName1: "Rusty",
          image2: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg",
          petName2: "Bella",
          trailing: CircularButton(
            child: SvgPicture.asset("assets/images/icons/setupDate.svg"),
            backgroundColor: PetsTheme.currentMainColor.withOpacity(0.2),
            onPressed: () {},
            radius: PetsTheme.radius2,
          ),
        ),

        Divider(thickness: 1,),
      ],
    );
  }
}

class MatingTile extends StatelessWidget {

  MatingTile(
    {
      this.image1,
      this.petName1,
      this.image2,
      this.petName2,
      this.trailing,
    }
  );
  final String image1;
  final String image2;
  final String petName1;
  final String petName2;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CoupleAvatar(image1: image1, image2: image2,),
      title: Text("$petName1 Likes $petName2"),
      subtitle: Text("2 days ago"),
      trailing: trailing
    );
  }
}

class CoupleAvatar extends StatelessWidget {

  CoupleAvatar({this.image1, this.image2});
  final String image1;
  final String image2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: PetsTheme.radius1*2,
          height: PetsTheme.radius1*2,
          child: UserAvatar(
            image: image1,
            imageRatio: 1,
          ),
        ),
        SizedBox(width: PetsTheme.getSmallPadMarg(),),
        SvgPicture.asset("assets/images/icons/heart.svg", color: Colors.pink, height: 12,),
        SizedBox(width: PetsTheme.getSmallPadMarg(),),
        CircleAvatar(
          backgroundImage: Image.network(image2).image,
          radius: PetsTheme.radius1,
        ),
      ],
    );
  }
}