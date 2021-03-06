import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/Pair.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';


class PetProfileCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Pet pet = Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina");

    return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //pp & data
                  Row(
                    children: [
                      Container(
                        height: PetsTheme.radius6*2,
                        width: PetsTheme.radius6*2,
                        child: UserAvatar(
                          image: pet.image,imageRatio: 1,
                        ),
                      ),
                      SizedBox(width: 20,),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pet.name, style: TextStyle(fontSize: PetsTheme.getLargerFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: PetsTheme.getLargerPadMarg(),),
                            
                            Pair(
                              Container(
                                height: PetsTheme.radius5,
                                width: PetsTheme.radius5,
                                child: UserAvatar(
                                  image: "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",imageRatio: 1,
                                ),
                              ), 
                              Padding(
                                padding: EdgeInsets.only(left: PetsTheme.getSmallPadMarg()),
                                child: Text("AHmed Abdallah", style: TextStyle(color: Colors.white, fontSize: PetsTheme.getMeduimFont()),),
                              ),
                              direction: Axis.horizontal,
                            ),

                            SizedBox(height: PetsTheme.getLargerPadMarg(),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundButton(
                                child: FittedBox(child: Text("Following", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: Colors.white),)),
                                borderColor: Colors.white,
                                height: 30,
                                width: MediaQuery.of(context).size.width/3,  // good for SmallFont
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

                  SizedBox(height: PetsTheme.getLargerPadMarg(),),

                  //friends & pets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [ 
                      GestureDetector(
                        child: Pair(
                          Text("200", style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Folloers",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                      //  onTap: () => Navigator.pushNamed(context, 'friends'),
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("2",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Matings",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                      //  onTap: () => Navigator.pushNamed(context, 'pets'),
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("10",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Reviews",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                      //  onTap: () {print("Reviews");},
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("45",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Photos",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                     //   onTap: () {print("Photos");},
                      ),
                    ],
                  ),
                  SizedBox(height: PetsTheme.getLargePadMarg(),),
                ],
              ),
            );
  }
}