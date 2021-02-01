import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/home/Notifications.dart';
import 'package:petmatch/screens/home/Search.dart';
import 'package:petmatch/screens/home/chart.dart';
import 'package:petmatch/screens/home/home.dart';
import 'package:petmatch/screens/login/splash.dart';
import 'package:petmatch/theme/petsTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return PageTransition(child: HomeScreen(), type: PageTransitionType.bottomToTop);
            break;
          case '/notifications':
            return PageTransition(child: NotificationsScreen(), type: PageTransitionType.bottomToTop);
            break;
          case '/chat':
            return PageTransition(child: ChatScreen(), type: PageTransitionType.bottomToTop);
            break;
          case '/search':
            return PageTransition(child: SearchScreen(), type: PageTransitionType.bottomToTop);
          default:
            return null;
        }
      },
      title: 'PetMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Roboto",
        primaryColor: PetsTheme.blackTextColor,
        //This adds swipe back option on both android and iOS
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: SplashScreen(),
    );
  }
}
