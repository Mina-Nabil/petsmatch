import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:petmatch/global.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:petmatch/widgets/screens/PetMatchTabsScreen.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'dart:ui';
import '../../theme/petsTheme.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String firebase_token;
  UserProvider userProvider;

  @override
  void initState() {
    _visible = false;
    userProvider = Provider.of<UserProvider>(context, listen: false);
    firebaseCloudMessaging_Listeners();

    super.initState();
    checkIfLoggedIn();
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {
      setState(() {
        userProvider.updateFirebase(token);
      });
      print(token);
    });
  }

  void checkIfLoggedIn() async {
    String token = await Server.token;
    print("$token is the value of the server token");
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        _visible = true;
      });
    });
    Future.delayed(Duration(milliseconds: 3000)).then((_) async {
      if (token == null || token == "") {
        Navigator.pushReplacement(
            context,
            new PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 1200),
                child: LoginScreen()));
      } else {
        int status = await userProvider.me();
        print('$status is the status');
        if (status > 300) {
          new PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 1200),
              child: LoginScreen());
        } else {
          User _user = userProvider.user;
          print("$_user value is ...");
          Navigator.pushReplacement(
              context,
              new PageTransition(
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 1200),
                  child: PetMatchMainScreen()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    PetsTheme.initTheme(context);

    //Padding & Marging Init
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          image: DecorationImage(
            image: Image.asset("assets/images/masks/def_blue.png").image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                PetsTheme.currentBgMainColor.withOpacity(1.0),
                BlendMode.srcOut),
          ),
        ),
        child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                    fit: FlexFit.loose,
                    flex: 6,
                    child: Container(
                        alignment: Alignment.center,
                        child: Hero(
                            tag: "logo",
                            child: SvgPicture.asset(
                              "assets/images/logo/orig.svg",
                              color: PetsTheme.whiteBarColor,
                            )))),
              ],
            )),
      ),
    );
  }
}
