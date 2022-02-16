import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/models/Chat.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/providers/api_providers/message_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = true;
  List<Chat> _recentChats;
  Widget chatsWidget;
  MessagesProvider messagesProvider;
  UserProvider userProvider;
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    messagesProvider = Provider.of<MessagesProvider>(context, listen: false);
    Future.delayed(Duration.zero).then((value) => getChats());
    super.initState();
  }

  void getChats() async {
    int status = await messagesProvider.getAllChats(userProvider.user.token);
    print(status);
    setState(() {
      isLoading = false;
      if (status >= 200 && status < 300) {
        _recentChats = messagesProvider.chats;
        print(_recentChats);
        chatsWidget = ListView.builder(
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
                        image: _recentChats[index].senderImage == null
                            ? ""
                            : _recentChats[index].senderImage,
                        imageRatio: 1,
                      ),
                      title: UserNameRole(
                          name: _recentChats[index].senderName,
                          role: _recentChats[index].senderRole == null
                              ? "User"
                              : _recentChats[index].senderRole),
                      subtitle: Text(
                        "...",
                        style: TextStyle(color: PetsTheme.blackTextColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                          DateFormat.jm().format(_recentChats[index].date)),
                      onTap: () {
                        messagesProvider.setSelectedChat(_recentChats[index]);
                        Navigator.of(context).pushNamed('conversation');
                      }),
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
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MessagesProvider _chatProvider =
        Provider.of<MessagesProvider>(context, listen: false);

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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await getChats();
                },
                child: Container(
                  child: chatsWidget,
                ),
              ));
  }
}
