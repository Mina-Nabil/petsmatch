import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/UI/profile/ProfileScreen.dart';
import 'package:petmatch/screens/main_screen/SearchScreen.dart';
import 'package:petmatch/screens/main_screen/ConversationScreen.dart';
import 'package:petmatch/screens/post_screens/LoversScreen.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/screens/login/splash.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/mating/FindMateScreen.dart';
import 'package:petmatch/ui/mating/FindMateStartScreen.dart';
import 'package:petmatch/ui/mating/SelectPetScreen.dart';
import 'package:petmatch/ui/profile/FriendsListScreen.dart';
import 'package:petmatch/ui/profile/PetProfileScreen.dart';
import 'package:petmatch/ui/profile/PetsListScreen.dart';
import 'package:petmatch/ui/profile/PhotosScreen.dart';
import 'package:petmatch/widgets/screens/PetMatchTabsScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'home':
            return CupertinoPageRoute(
            builder: (_) => PetMatchMainScreen(),settings: settings );
            break;
          case 'search':
            return CupertinoPageRoute(
              builder: (_) => SearchScreen(), settings: settings
            );
            break;
          case 'conversation':
            return CupertinoPageRoute(
              builder: (_) => ConversationScreen(), settings: settings
            );
            break;
          case 'lovers':
            return CupertinoPageRoute(
            builder: (_) => LoversScreen(), settings: settings);
            break; 
          case 'post':
            return CupertinoPageRoute(
            builder: (_) => PostScreen(), settings: settings);
            break;
          case 'profile':
            return CupertinoPageRoute(
            builder: (_) => ProfileScreen(), settings: settings);
            break;
          case 'petProfile':
            return CupertinoPageRoute(
            builder: (_) => PetProfileScreen(), settings: settings);
            break;
          case 'friends':
            return CupertinoPageRoute(
            builder: (_) => FriendsListScreen(), settings: settings);
          case 'pets':
            return CupertinoPageRoute(
            builder: (_) => PetsListScreen(), settings: settings);
            break;
          case 'photos':
            return CupertinoPageRoute(
            builder: (_) => PhotosScreen(), settings: settings);
            break;
          case 'Mating/SelectPet':
            return CupertinoPageRoute(
              builder: (_) => SelectPetScreen(), settings: settings);
          case 'Mating/FindMateStart':
            return CupertinoPageRoute(
              builder: (_) => FindMateStartScreen(), settings: settings);
          case 'Mating/FindMate':
            return CupertinoPageRoute(
              builder: (_) => FindMateScreen(), settings: settings);
          default:
            return null;
        }
      },
      title: 'PetMatch',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontFamily: "Roboto",
          color: PetsTheme.blackTextColor
        )
      ),
        //primarySwatch: Colors.blue,
        //fontFamily: "Roboto",
        //primaryColor: Colors.white,
        //This adds swipe back option on both android and iOS
        /*pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),*/
      ),
      home: SplashScreen(),
    );
  }
}
