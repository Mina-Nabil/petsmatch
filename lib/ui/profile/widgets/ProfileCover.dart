import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
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
                                      margin: EdgeInsets.only(right: PetsTheme.getMeduimPadMarg()),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 35, width: 35,
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
                        child: Text("Send a message", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: PetsTheme.currentMainColor),),
                        color: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width/3, // good for SmallFont
                      ),
                      
                      RoundButton(
                        child: Text("Friends", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: Colors.white),),
                        borderColor: Colors.white,
                        height: 30,
                        width: MediaQuery.of(context).size.width/3,  // good for SmallFont
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: Placeholder(),
                      )
                    ],
                  ),

                  SizedBox(height: PetsTheme.getLargerPadMarg(),),

                  //friends & pets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 30, height: 30, child: Placeholder(),),
                      Container(width: 30, height: 30, child: Placeholder(),),
                      Container(width: 30, height: 30, child: Placeholder(),),
                      Container(width: 30, height: 30, child: Placeholder(),),
                    ],
                  ),
                ],
              ),
            );
  }
}

class RoundButton extends StatelessWidget {

  RoundButton({
    this.child,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.borderColor = Colors.transparent
  });
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final borderColor;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    print(PetsTheme.getSmallFont());
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color, 
        border: Border.all(color: borderColor), 
        borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont())
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}