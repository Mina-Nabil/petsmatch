import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/screens/mating/FindMateCard.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';

List<Pet> pets = [
    Pet("Coco", "https://images.indianexpress.com/2021/01/Golden-Retriever-dog.jpg", "Ahmed Mostafa"),
    Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),
    Pet("Lili", "https://communityimpact.com/uploads/images/2020/11/12/101807.JPG", "Aly"),
];
class FindMateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.network("https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=1600&h=900",).image,
            radius: PetsTheme.radius1,
          ),
          SizedBox(width: PetsTheme.getSmallPadMarg(),),
          Text("Bella is looking for a Mate",
            style: TextStyle(
              fontSize: PetsTheme.getLargeFont(),
              color: Colors.white,
              fontWeight: FontWeight.bold))
        ],
      ),
      //body: FindMatingCard(pets[0]),
      body: PageView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return FindMatingCard(pets[index]);
        }
      ),
    );
  }
}