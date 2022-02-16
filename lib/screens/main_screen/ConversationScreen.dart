import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/models/Message.dart';
import 'package:petmatch/providers/api_providers/message_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:provider/provider.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<ConversationScreen> {
  List<Message> messages;

  List<Widget> messagesWidget;

  MessagesProvider messagesProvider;
  UserProvider userProvider;
  final TextEditingController _messageController = TextEditingController();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void initState() {
    messagesWidget = [];
    messagesProvider = Provider.of<MessagesProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    firebaseCloudMessaging_Listeners();

    Future.delayed(Duration.zero).then((value) => getMessages());
    super.initState();
  }

  void firebaseCloudMessaging_Listeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("message reecieved");
        setState(() {
          messagesWidget.add(ConversationTextTile(
              message['notification']['body'],
              messagesProvider
                  .selectedChat.senderImage, //ConversationType.RECEIVE);
              ConversationType.RECEIVE));
        });
      },
    );
  }

  void getMessages() async {
    int status = await messagesProvider.getChat(
        userProvider.user.token, messagesProvider.selectedChat.senderId);
    setState(() {
      messages = messagesProvider.messages;
      if (status >= 200 && status < 300) {
        messagesWidget = [];

        messagesWidget.addAll(
          messages.map((e) {
            print(
                'the content of the message is ${e.senderid} and ${userProvider.user.id}');

            return ConversationTextTile(
                e.content,
                e.senderImg == null
                    ? "https://cdn.pixabay.com/photo/2012/04/18/00/07/silhouette-of-a-man-36181_1280.png"
                    : e.senderImg, //ConversationType.RECEIVE);
                e.senderid == userProvider.user.id
                    ? ConversationType.SEND
                    : ConversationType.RECEIVE);
          }).toList(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var isLoading;
    return PetMatchSingleScreen(
        backArrow: true,
        title: Row(
          children: [
            Container(
                width: 30,
                height: 30,
                child: UserAvatar(
                  image: messagesProvider.selectedChat.senderImage == null
                      ? ""
                      : messagesProvider.selectedChat.senderImage,
                  imageRatio: 1,
                )),
            SizedBox(
              width: PetsTheme.getMeduimPadMarg(),
            ),
            Text(
              messagesProvider.selectedChat.senderName,
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: PetsTheme.getMuchLargerFont(),
                  color: PetsTheme.whiteBarColor,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        bodyBackgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            await getMessages();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    children: messagesWidget),
              ),
              Container(
                  margin: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: " Write a message ...",
                              hintStyle: TextStyle(
                                  color: PetsTheme.petsHintGrayColor)),
                        ),
                      ),
                      SizedBox(
                        width: PetsTheme.getLargePadMarg(),
                      ),
                      FittedBox(
                        child: GestureDetector(
                          child: Icon(
                            Icons.send,
                            color: PetsTheme.currentBgMainColor,
                          ),
                          onTap: () async {
                            int status = await messagesProvider.sendMessage(
                                messagesProvider.selectedChat.senderId,
                                _messageController.text.trim(),
                                userProvider.user.token);

                            if (status >= 200 && status < 300)
                              setState(() {
                                _messageController.clear();
                                print("adding messages widget");
                                messagesWidget.add(ConversationTextTile(
                                    _messageController.text.trim(),
                                    userProvider.user.image == null
                                        ? "https://cdn.pixabay.com/photo/2012/04/18/00/07/silhouette-of-a-man-36181_1280.png"
                                        : userProvider.user
                                            .image, //ConversationType.RECEIVE);
                                    ConversationType.SEND));
                              });
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

enum ConversationType { SEND, RECEIVE }

abstract class ConversationTextTile extends StatelessWidget {
  factory ConversationTextTile(
      String text, String image, ConversationType type) {
    if (type == ConversationType.RECEIVE) {
      return ConversationTextTileReceived(
        text: text,
        image: image,
      );
    } else {
      return ConversationTextTileSend(
        text: text,
        image: image,
      );
    }
  }
}

class ConversationTextTileReceived extends StatelessWidget
    implements ConversationTextTile {
  const ConversationTextTileReceived({
    @required this.text,
    @required this.image,
  });

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(left: PetsTheme.getSmallestPadMarg()),
          child: UserAvatar(
            image: image,
            imageRatio: 1,
          )),
      Expanded(
        child: Container(
          margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("02:09 PM",
                  style: TextStyle(
                      fontSize: PetsTheme.getVerySmallFont(),
                      color: PetsTheme.petsHintGrayColor)),
              Container(
                padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                decoration: BoxDecoration(
                  color: PetsTheme.commentBgColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                    bottomRight: const Radius.circular(15.0),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class ConversationTextTileSend extends StatelessWidget
    implements ConversationTextTile {
  const ConversationTextTileSend({
    @required this.text,
    @required this.image,
  });

  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("02:09 PM",
                        style: TextStyle(
                            fontSize: PetsTheme.getVerySmallFont(),
                            color: PetsTheme.petsHintGrayColor)),
                    Container(
                      padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg()),
                      decoration: BoxDecoration(
                        color: PetsTheme.currentMainColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(15.0),
                          topLeft: const Radius.circular(15.0),
                          bottomRight: const Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: PetsTheme.getMeduimFont()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(left: PetsTheme.getSmallestPadMarg()),
                child: UserAvatar(
                  image: image,
                  imageRatio: 1,
                )),
          ]),
    );
  }
}
