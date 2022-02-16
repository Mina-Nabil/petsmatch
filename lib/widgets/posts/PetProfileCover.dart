import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/Pair.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';

class PetProfileCover extends StatelessWidget {
  @override
  PetProvider petProvider;

  Widget build(BuildContext context) {
    petProvider = Provider.of<PetProvider>(context);

    Pet pet = petProvider.selectedPet;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //pp & data
          Row(
            children: [
              Container(
                height: PetsTheme.radius6 * 2,
                width: PetsTheme.radius6 * 2,
                child: UserAvatar(
                  image: pet.image,
                  imageRatio: 1,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pet.name,
                        style: TextStyle(
                            fontSize: PetsTheme.getLargerFont(),
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: PetsTheme.getLargerPadMarg(),
                    ),
                    Pair(
                      Container(
                        height: PetsTheme.radius5,
                        width: PetsTheme.radius5,
                        child: UserAvatar(
                          image: "",
                          imageRatio: 1,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: PetsTheme.getSmallPadMarg()),
                        child: Text(
                          "${pet.owner}'s pet",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: PetsTheme.getMeduimFont()),
                        ),
                      ),
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: PetsTheme.getLargerPadMarg(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundButton(
                          child: FittedBox(
                              child: Text(
                            "Following",
                            style: TextStyle(
                                fontSize: PetsTheme.getSmallFont(),
                                color: Colors.white),
                          )),
                          borderColor: Colors.white,
                          height: 30,
                          width: MediaQuery.of(context).size.width /
                              3, // good for SmallFont
                        ),
                        CircularMoreButton(
                          radius: 15,
                          color: Colors.white,
                          backgroundColor: Color.fromRGBO(20, 44, 122, 0.5),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),

          //friends & pets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Pair(
                  Text("200",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Folloers",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                //  onTap: () => Navigator.pushNamed(context, 'friends'),
              ),
              GestureDetector(
                child: Pair(
                  Text("2",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Matings",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                //  onTap: () => Navigator.pushNamed(context, 'pets'),
              ),
              GestureDetector(
                child: Pair(
                  Text("10",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Reviews",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                //  onTap: () {print("Reviews");},
              ),
              GestureDetector(
                child: Pair(
                  Text("45",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Photos",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                //   onTap: () {print("Photos");},
              ),
            ],
          ),
          SizedBox(
            height: PetsTheme.getLargePadMarg(),
          ),
        ],
      ),
    );
  }
}
