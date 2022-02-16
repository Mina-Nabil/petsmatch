import 'package:flutter/material.dart';
import 'package:petmatch/models/NotificationModel.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isLoading = true;
  UserProvider userProvider;
  List<NotificationModel> _notifications = [];

  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);

    super.initState();
    loadNotifications();
  }

  void loadNotifications() async {
    int status = await userProvider.getNotifications();
    if (status >= 200 || status < 300)
      setState(() {
        isLoading = false;
        _notifications = userProvider.notifications;
      });
  }

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: false,
      title: Text(
        "Notifications",
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: PetsTheme.getMuchLargerFont(),
            color: PetsTheme.whiteBarColor,
            fontWeight: FontWeight.bold),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                ..._notifications.map((notification) {
                  return Column(children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: UserAvatar(
                        image: notification.imageurl,
                        imageRatio: 1,
                      ),
                      title: Text(
                        notification.text,
                        style: TextStyle(fontSize: PetsTheme.getSmallFont()),
                      ),
                      trailing: Text(
                        timeago.format(notification.datetime,
                            locale: "en_short"),
                        style: TextStyle(
                            fontSize: PetsTheme.getVerySmallFont(),
                            color: Colors.grey),
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ]);
                }).toList()
              ],
            ),
      bodyBackgroundColor: Colors.white,
    );
  }
}
