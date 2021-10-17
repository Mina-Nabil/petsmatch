import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/models/Chat.dart';
import 'package:petmatch/providers/api_providers/chat_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/UserNameRole.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  List<Chat> _recentChats;
  @override
  Widget build(BuildContext context) {
    ChatProvider _chatProvider =
        Provider.of<ChatProvider>(context, listen: false);
    Future<int> status = _chatProvider.getChats(
        token: "2|40Ycic1T4aJlOXpiHbJHqBiaM8ozIWjQxv56kDZb");
    if (status == 1) _recentChats = _chatProvider.chat;
    print("recent chats ${_recentChats}");
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
