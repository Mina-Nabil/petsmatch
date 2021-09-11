import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {

  List<User> searchResultsPeople = [
    User(name: "Ahmed Abbas", image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg", email: "_email",
    pets: [
      Pet(name: "Roy", image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg", owner: "Ahmed Abbas"),
    ]),

    User(name: "Aya Ahmed", image: "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg", email: "_email",
    pets: [
      Pet(name: "Lilly", image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/why-cats-are-best-pets-worshipped-animals-1559234295.jpg", owner: "Aya Ahmed"),
    ]
    ),
  ];

  List<User> searchResultsTrainers = [
    User(name: "Ahmed Abbas", image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg", email: "_email",
    pets: [
      Pet(name: "Roy", image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg", owner: "Ahmed Abbas"),
    ]),

    User(name: "Aya Ahmed", image: "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg", email: "_email",
    pets: [
      Pet(name: "Lilly", image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/why-cats-are-best-pets-worshipped-animals-1559234295.jpg", owner: "Aya Ahmed"),
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

    return PetMatchSingleScreen(
      backArrow: true,
      //scrollableHeader: false,
      title: Text(
        "What are you looking for?",
        style: TextStyle(
          fontFamily: "Roboto",
          color: PetsTheme.whiteBarColor,
          fontWeight: FontWeight.bold,
          fontSize: PetsTheme.getLargeFont()
        ),
      ),
      header: Container(
        padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
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
      body: ListView(
        padding: EdgeInsets.zero,
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
    );

    /*return PetMatchSingleScreen(
      backArrow: true,
      title: Text("What are you looking for?",
        style: TextStyle(
          fontFamily: "Roboto",
          color: PetsTheme.whiteBarColor,
          fontWeight: FontWeight.bold,
          fontSize: PetsTheme.getLargeFont()
        ),
      ),
      body: PetMatchContainer(

        headerPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        header: TextField(
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

        bodyPadding: EdgeInsets.zero,
          body: ListView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
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
    );*/
  }
}
