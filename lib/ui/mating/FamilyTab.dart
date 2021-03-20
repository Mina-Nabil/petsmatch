import 'package:flutter/material.dart';
import 'package:petmatch/ui/mating/CrushTab.dart';


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
        ),

        Divider(thickness: 1,),

        MatingTile(
          image1: "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg",
          petName1: "Rusty",
          image2: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg",
          petName2: "Bella",
        ),

        Divider(thickness: 1,),
      ],
    );
  }
}
