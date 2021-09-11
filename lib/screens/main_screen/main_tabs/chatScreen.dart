import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';

class Chat {
  Chat({this.user, this.lastText, this.dateTime});
  User user;
  String lastText;
  DateTime dateTime;
}

class ChatScreen extends StatelessWidget {
  List<Chat> _recentChats = [
    Chat(
        user: User(
            name: "Ahmed Abbas",
            image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
            email: "_email",
            pets: [
              Pet(
                  name: "Roy",
                  image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg",
                  owner: "Ahmed Abbas"),
            ]),
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
        lastText: "Hey, How's everything going"),
    Chat(
        user: User(
            name: "Ahmed Abbas",
            image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
            email: "_email",
            pets: [
              Pet(
                 name:  "Roy",
                  image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg",
                  owner: "Ahmed Abbas"),
            ]),
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
        lastText: "Hello Dear, How's everything going"),
    Chat(
        user: User(
            name: "Ahmed Abbas",
            image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
            email: "_email",
            pets: [
              Pet(
                  name: "Roy",
                  image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg",
                  owner: "Ahmed Abbas"),
            ]),
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
        lastText: "Hey, How's everything going"),
    Chat(
        user: User(
           name: "Ahmed Abbas",
            image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
            email: "_email",
            pets: [
              Pet(
                  name: "Roy",
                  image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg",
                  owner: "Ahmed Abbas"),
            ]),
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
        lastText: "Hey, How's everything going"),
    Chat(
        user: User(
            name:"Ahmed Abbas",
            image: "https://upload.wikimedia.org/wikipedia/en/thumb/a/a1/NafSadh_Profile.jpg/768px-NafSadh_Profile.jpg",
            email: "_email",
            pets: [
              Pet(
                  name: "Roy",
                  image: "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg",
                  owner: "Ahmed Abbas"),
            ]),
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
        lastText: "Hey, How's everything going"),
  ];

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      //scrollableHeader: false,
      backArrow: false,
      title: Text(
        "Chats",
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: PetsTheme.getMuchLargerFont(),
            color: PetsTheme.whiteBarColor,
            fontWeight: FontWeight.bold),
      ),

      bodyBackgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _recentChats.length,
            itemBuilder: (context, index) {
              return Column(children: [
                Slidable(
                  key: UniqueKey(),
                  direction: Axis.horizontal,
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 1 / 6,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: PetsTheme.getSmallerPadMarg(),
                        horizontal: 20),
                    leading: UserAvatar(
                      image: _recentChats[index].user.image,
                      imageRatio: 1,
                    ),
                    title: UserNameRole(
                        name: _recentChats[index].user.name,
                        role: _recentChats[index].user.whoIAm()),
                    subtitle: Text(
                      _recentChats[index].lastText,
                      style: TextStyle(color: PetsTheme.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text(
                        DateFormat.jm().format(_recentChats[index].dateTime)),
                    onTap: () =>
                        Navigator.of(context).pushNamed('conversation'),
                  ),
                  secondaryActions: <Widget>[
                    Container(
                      color: PetsTheme.petsRedColor,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                color: PetsTheme.petsPurpleColor,
                                icon: SvgPicture.asset(
                                  "assets/images/icons/delete.svg",
                                  color: Colors.white,
                                  width: PetsTheme.smallIconSize(),
                                  height: PetsTheme.smallIconSize(),
                                ),
                                onPressed: () {
                                  print("delete chat");
                                })
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: PetsTheme.petsPurpleColor,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                color: PetsTheme.petsPurpleColor,
                                icon: SvgPicture.asset(
                                  "assets/images/icons/edit.svg",
                                  color: Colors.white,
                                  width: PetsTheme.smallIconSize(),
                                  height: PetsTheme.smallIconSize(),
                                ),
                                onPressed: () {
                                  print("edit chat");
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                )
              ]);
            }),
      ),
    );
  }
}
