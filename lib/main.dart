import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/main_screen/SearchScreen.dart';
import 'package:petmatch/screens/main_screen/ConversationScreen.dart';
import 'package:petmatch/screens/post_screens/LoversScreen.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/widgets/screens/PetMatchTabsScreen.dart';
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
            return PageTransition(child: PetMatchMainScreen(), type: PageTransitionType.bottomToTop);
            break;
          case '/search':
            return PageTransition(child: SearchScreen(), type: PageTransitionType.rightToLeft);
          case '/conversation':
            return PageTransition(child: ConversationScreen(), type: PageTransitionType.rightToLeft);
          case '/lovers':
            return PageTransition(child: LoversScreen(), type: PageTransitionType.bottomToTop);
          case '/post':
            return PageTransition(child: PostScreen(), type: PageTransitionType.rightToLeft);
            break; 
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
