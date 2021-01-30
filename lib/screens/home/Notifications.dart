import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';
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
    return BaseScreen(
      titleText: "Notifications",
      titleStyle: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
      titleCenter: false,
      isAppBarBackArrow: false,
      isNavBar: true,
      isLeftPadding: false,
      isRightPadding: false,

      child: Container(
        padding: EdgeInsets.only(top: PetsTheme.getSmallPadMarg()),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20))
        ),
        child: ListView(
          children: [
            ..._notifications.map((notification) {
              print("here");
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: PetsTheme.getLargerPadMarg(), vertical: PetsTheme.getMeduimPadMarg()),
                leading: UserAvatar(image: notification.imageurl, imageRatio: 1,),
                title: Text(notification.text, style: TextStyle(fontSize: PetsTheme.getSmallFont()),),
                trailing: Text(timeago.format(notification.datetime, locale: "en_short"), style: TextStyle(fontSize: PetsTheme.getVerySmallFont(), color: Colors.grey),),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}