import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/search_provider.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  List<User> searchResultsPeople = [];

  List<Pet> searchResultsPets = [];

  List<Post> searchResultsPosts = [];

  FocusNode myFocusNode;

  List<Widget> searchResultWidgets = [];

  SearchProvider searchProvider;
  showSearch(String value) async {
    print("${value} in the show search");
    int status = await searchProvider.search(searchContent: value);
    if (status >= 200 && status < 300)
      searchResultsPeople = searchProvider.searchedUsers;

    print(status);
    // searchResultsPets = searchProvider.searchedPets;
    // searchResultsPosts = searchProvider.searchedPosts;
    setState(() {
      // print(searchResultsPeople);
      // searchResultWidgets = [];
      // searchResultWidgets.addAll([
      //   Container(
      //       margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
      //       child: Text(
      //         "People",
      //         style: TextStyle(
      //             fontSize: PetsTheme.getMeduimFont(),
      //             fontWeight: FontWeight.bold),
      //       )),
      //   ...searchResultsPeople.map((e) {
      //     return Padding(
      //       padding:
      //           EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
      //       child: Expanded(
      //           child: ListTile(
      //         contentPadding: EdgeInsets.zero,
      //         leading: UserAvatar(
      //           imageRatio: 1,
      //         ),
      //         title: UserNameRole(name: e.name, role: e.whoIAm()),
      //       )),
      //     );
      //   }).toList(),
      //   //],
      //   // ),
      //   // ),
      // ]);
    });
  }

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return PetMatchSingleScreen(
      backArrow: true,
      //scrollableHeader: false,
      title: Text(
        "What are you looking for?",
        style: TextStyle(
            fontFamily: "Roboto",
            color: PetsTheme.whiteBarColor,
            fontWeight: FontWeight.bold,
            fontSize: PetsTheme.getLargeFont()),
      ),
      header: Container(
        padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        child: TextField(
          onSubmitted: (txt) {
            print("${txt} is the value of the text field");
            Future.delayed(Duration.zero).then((value) => showSearch(txt));
          },
          focusNode: myFocusNode,
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: "Search PetsMatch",
            hintStyle: TextStyle(fontSize: PetsTheme.getMeduimFont()),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          //people
          if (searchResultsPeople.isNotEmpty)
            Container(
              margin: EdgeInsets.only(bottom: PetsTheme.getLargerPadMarg()),
              padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                      child: Text(
                        "People",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            fontWeight: FontWeight.bold),
                      )),
                  ...searchResultsPeople.map((e) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: PetsTheme.getSmallPadMarg()),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            'profile',
                            arguments: <String, dynamic>{
                              'data': e,
                            },
                          );
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: UserAvatar(
                            image: e.image,
                            imageRatio: 0.1,
                          ),
                          title: UserNameRole(name: e.name, role: e.whoIAm()),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

          // if (searchResultWidgets.isNotEmpty) searchResultWidgets[0],
          // trainers
          if (searchResultsPets.isNotEmpty)
            Container(
              margin: EdgeInsets.only(bottom: PetsTheme.getLargerPadMarg()),
              padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                      child: Text(
                        "Trainers",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            fontWeight: FontWeight.bold),
                      )),
                  ...searchResultsPets.map((e) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: PetsTheme.getSmallPadMarg()),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: UserAvatar(
                          image: e.image,
                          imageRatio: 1,
                        ),
                        title: UserNameRole(name: e.name, role: e.whoIAm()),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

          // posts
          // trainers
          if (searchResultsPosts.isNotEmpty)
            Container(
              padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                      child: Text(
                        "Posts",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            fontWeight: FontWeight.bold),
                      )),
                  ...searchResultsPosts.map((e) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: PetsTheme.getSmallPadMarg()),
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
