import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:timeago/timeago.dart' as timeago;

class Notification {
  Notification({
    this.imageurl,
    this.text,
    this.datetime
  });
  final String imageurl;
  final String text;
  final DateTime datetime;
}

class NotificationsScreen extends StatelessWidget {

  List<Notification> _notifications = [
    Notification(
      imageurl: "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg",
      text: "this is notification text", 
      datetime: DateTime.now()),
    Notification(
      imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGqeiMvcMA8ATx6McIgv0QgGq9njL6_9Q9Ww&usqp=CAUg",
      text: "this is notification text", 
      datetime: DateTime.now().subtract(Duration(hours: 1))),
    Notification(
      imageurl: "https://static.jobscan.co/blog/uploads/linkedin-profile-picture-1280x720.jpg",
      text: "this is notification text", 
      datetime:DateTime.now().subtract(Duration(hours: 5))),
    Notification(
      imageurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGqeiMvcMA8ATx6McIgv0QgGq9njL6_9Q9Ww&usqp=CAUg",
      text: "this is notification text", 
      datetime: DateTime.now().subtract(Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: false,
      body: PetMatchContainer(
        header: Text("Notifications",
          style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            ..._notifications.map((notification) {
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
                    leading: UserAvatar(image: notification.imageurl, imageRatio: 1,),
                    title: Text(notification.text, style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                    trailing: Text(timeago.format(notification.datetime, locale: "en_short"), style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: Colors.grey),),
                  ),
                  Divider( height: 0,thickness: 1,),
                ]
              );
            }).toList()
          ],
        ),
        bodyBackgroundColor: Colors.white,
      ),
    );
  }
}
