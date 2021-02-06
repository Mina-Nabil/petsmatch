import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';
import 'package:petmatch/widgets/screens/PetMatchScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  List<User> searchResultsPeople = [
    User("Ahmed Abbas", "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg", "_email", 
    pets: [
      Pet("Roy", "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg", "Ahmed Abbas"),
    ]),

    User("Aya Ahmed", "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg", "_email",
    pets: [
      Pet("Lilly", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/why-cats-are-best-pets-worshipped-animals-1559234295.jpg", "Aya Ahmed"),
    ]
    ),
  ];

  List<User> searchResultsTrainers = [
    User("Ahmed Abbas", "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg", "_email", 
    pets: [
      Pet("Roy", "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg", "Ahmed Abbas"),
    ]),

    User("Aya Ahmed", "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg", "_email",
    pets: [
      Pet("Lilly", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/why-cats-are-best-pets-worshipped-animals-1559234295.jpg", "Aya Ahmed"),
    ]
    ),
  ];

  List<Post> searchResultsPosts = [
    RegularPost(
      owner: UserPostOwner(id: 1, name: "Ahmed Mahmoud", imageUrl: "https://www.leisureopportunities.co.uk/images/995586_746594.jpg", pets: ["Rex"]), 
      commentsCount: 5, 
      lovesCount: 2, 
      sharesCount: 0, 
      postDate: DateTime.now(),
      isLoved: false,
      text: "Any recommendations for good vets ?!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PetMatchScreen(

        body: PetMatchContainer(
          header: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Container(
                child: FittedBox(
                  child: Text(
                    "What are you looking for?",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: PetsTheme.whiteBarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: PetsTheme.getLargeFont()
                    ),
                  ),
                ),
              ),

              SizedBox(height: PetsTheme.getMeduimPadMarg(),),

              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide( width: 0,style: BorderStyle.none,),
                            ),
                            prefixIcon: Icon(Icons.search,),
                            hintText: "Search PetsMatch",
                            hintStyle: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                          ),
                        ),
                    ),

                    SizedBox(width: PetsTheme.getLargePadMarg(),),

                    FittedBox(
                      child: GestureDetector(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: PetsTheme.whiteBarColor,
                              fontWeight: FontWeight.normal,
                              fontSize: PetsTheme.getLargeFont()),
                        ),
                        onTap:  () {
                          Navigator.of(context).pop();
                        } ,
                      ),
                    ),
                  ],
                )),
            ]),

          bodyPadding: EdgeInsets.zero,
          body: ListView(
            children: [

              //people
              if(searchResultsPeople.isNotEmpty) 
              Container(
                margin: EdgeInsets.only(bottom :PetsTheme.getLargerPadMarg()),
                padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                        margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                        child: Text("People", style: TextStyle(fontSize: PetsTheme.getMeduimFont(), fontWeight: FontWeight.bold),)),

                    ...searchResultsPeople.map((e) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: UserAvatar(image: e.image,imageRatio: 1,),
                          title: UserNameRole(name: e.name, role: e.whoIAm()),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              // trainers
              if(searchResultsTrainers.isNotEmpty) 
              Container(
                margin: EdgeInsets.only(bottom :PetsTheme.getLargerPadMarg()),
                padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                        margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                        child: Text("Trainers", style: TextStyle(fontSize: PetsTheme.getMeduimFont(), fontWeight: FontWeight.bold),)),

                    ...searchResultsTrainers.map((e) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: UserAvatar(image: e.image,imageRatio: 1,),
                          title: UserNameRole(name: e.name, role: e.whoIAm()),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              // posts
              // trainers
              if(searchResultsPosts.isNotEmpty)
              Container(
                padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                        margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                        child: Text("Posts", style: TextStyle(fontSize: PetsTheme.getMeduimFont(), fontWeight: FontWeight.bold),)),

                    ...searchResultsPosts.map((e) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
                        child: RegularPostWidget(e),
                      );
                    }).toList(),
                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}
