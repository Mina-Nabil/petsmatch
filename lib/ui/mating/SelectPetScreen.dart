import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/Pair.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class SelectPetScreen extends StatelessWidget {
  final List<Pet> pets = [
      Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),
      Pet("Bella", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg", "Mina"),
      Pet("Rex", "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg", "Mina"),
  ];
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backgroundMask: bgMask.mating,
      backArrow: true,
      header: Padding(
        padding: const EdgeInsets.only(left:20, right: 20, bottom: 20),
        child: Text("Who is looking for a Mate?",style: TextStyle(fontSize: PetsTheme.getEvenMuchLargerFont(), color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      bodyBackgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg(), top: PetsTheme.getMuchLargerPadMarg(), right: PetsTheme.getMeduimPadMarg()),
        child: Wrap(
          spacing: PetsTheme.getLargestPadMarg(),
          runSpacing: PetsTheme.getLargestPadMarg(),
          alignment: WrapAlignment.center,
          children: [
            for (var pet in pets) 
              GestureDetector(
                child: Pair(
                  CircleAvatar(
                    backgroundImage: Image.network(pet.image).image,
                    radius: PetsTheme.radius3,
                  ),
                  Text(pet.name, style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: PetsTheme.blackTextColor),),
                  space: PetsTheme.getSmallPadMarg(),
                ),
                onTap: () => Navigator.pushNamed(context, 'Mating/FindMateStart'),
              )
          ]
        ),
      ),
    );
  }
}