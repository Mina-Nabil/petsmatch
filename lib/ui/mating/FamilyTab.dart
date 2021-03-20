import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/mating/CrushTab.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';


class FamilyTab extends StatelessWidget {
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
            child: SvgPicture.asset("assets/images/icons/ratingStar.svg", color: PetsTheme.currentMainColor,),
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
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.person, size: 20, color: PetsTheme.currentMainColor,),
              Text(" |3.0", style: TextStyle(color: PetsTheme.petsHintGrayColor),),
              SizedBox(width: PetsTheme.getSmallPadMarg(),),
              SvgPicture.asset("assets/images/icons/paw.svg",color: PetsTheme.currentMainColor, width: 18,),
              Text(" |3.0", style: TextStyle(color: PetsTheme.petsHintGrayColor)),
            ],
          ),
        ),

        Divider(thickness: 1,),
      ],
    );
  }
}
