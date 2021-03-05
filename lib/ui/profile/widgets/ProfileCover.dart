import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/Pair.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';


class ProfileCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User  mainUser =  User("Mina Abdallah","https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw", "hamada@pets" );
    List<Pet> pets = [
      Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),
      Pet("Bella", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg", "Mina"),
      Pet("Rex", "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg", "Mina"),
    ];
    mainUser.addAllPet(pets);
    
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
                          image: mainUser.image,imageRatio: 1,
                        ),
                      ),
                      SizedBox(width: 20,),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mainUser.name, style: TextStyle(fontSize: PetsTheme.getLargerFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (var pet in mainUser.pets) 
                                    Container(
                                      margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 40, width: 40,
                                            margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
                                            child: UserAvatar(image: pet.image,imageRatio: 1,),
                                          ),
                                          Text(pet.name, style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white),),
                                        ],
                                      ),
                                    )
                                ]
                              ),
                            ),
                          ],
                        ),
                      )
                    ],


                  ),

                  SizedBox(height: PetsTheme.getLargerPadMarg(),),
                  //buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundButton(
                        child: FittedBox(child: Text("Send a message", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: PetsTheme.currentMainColor),)),
                        color: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width/3, // good for SmallFont
                      ),
                      
                      RoundButton(
                        child: FittedBox(child: Text("Friends", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: Colors.white),)),
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
                  ),

                  SizedBox(height: PetsTheme.getLargerPadMarg(),),

                  //friends & pets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [ 
                      GestureDetector(
                        child: Pair(
                          Text("450", style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Friends",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                        onTap: () => Navigator.pushNamed(context, 'friends'),
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("2",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Pets",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                        onTap: () => Navigator.pushNamed(context, 'pets'),
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("30",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Reviews",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                        onTap: () {print("Reviews");},
                      ),
                      GestureDetector(
                        child: Pair(
                          Text("45",style: TextStyle(fontSize: PetsTheme.getLargeFont(), color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("Photos",style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.white,)),
                        ),
                        onTap: () {print("Photos");},
                      ),
                    ],
                  ),
                  SizedBox(height: PetsTheme.getLargePadMarg(),),
                ],
              ),
            );
  }
}