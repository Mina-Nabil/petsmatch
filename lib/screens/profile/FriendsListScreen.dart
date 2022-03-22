import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class FriendsListScreen extends StatefulWidget {
  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  UserProvider userProvider;
  List<User> friends = [];
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    Future.delayed(Duration.zero).then((value) => updateFollowers());
    super.initState();
  }

  void updateFollowers() async {
    int code = await userProvider.getfollowers();

    if (code >= 200 || code < 300) {
      setState(() {
        friends = userProvider.follows;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
        backArrow: true,
        title: Text(userProvider.user.name,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: PetsTheme.getMuchLargerFont(),
                color: PetsTheme.whiteBarColor,
                fontWeight: FontWeight.bold)),
        bodyBackgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.zero, children: [
          //people
          if (friends.isNotEmpty)
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
                        "Friends",
                        style: TextStyle(
                            fontSize: PetsTheme.getLargeFont(),
                            fontWeight: FontWeight.bold,
                            color: PetsTheme.currentMainColor),
                      )),
                  ...friends.map((e) {
                    return Column(children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: PetsTheme.getSmallPadMarg()),
                        leading: UserAvatar(
                          image: e.image,
                          imageRatio: 1,
                        ),
                        title: UserNameRole(name: e.name, role: e.whoIAm()),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ]);
                  }).toList(),
                ],
              ),
            ),
        ]));
  }
}
