import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/screens/main_screen/main_tabs/HomeScreen.dart';
import 'package:petmatch/screens/profile/ProfileScreen.dart';
import 'package:petmatch/screens/main_screen/SearchScreen.dart';
import 'package:petmatch/screens/main_screen/ConversationScreen.dart';
import 'package:petmatch/screens/post_screens/LoversScreen.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/screens/login/splash.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/screens/mating/FindMateScreen.dart';
import 'package:petmatch/screens/mating/FindMateStartScreen.dart';
import 'package:petmatch/screens/mating/PetReviewsScreen.dart';
import 'package:petmatch/screens/mating/SelectPetScreen.dart';
import 'package:petmatch/screens/profile/FriendsListScreen.dart';
import 'package:petmatch/screens/profile/PetProfileScreen.dart';
import 'package:petmatch/screens/profile/PetsListScreen.dart';
import 'package:petmatch/screens/profile/PhotosScreen.dart';
import 'package:petmatch/widgets/screens/PetMatchTabsScreen.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  MyApp();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UserProvider>(create: (_) => UserProvider()),
        ],
        child: CupertinoApp(
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case 'home':
                return CupertinoPageRoute(
                    builder: (_) => PetMatchMainScreen(), settings: settings);
                break;
              case 'search':
                return CupertinoPageRoute(
                    builder: (_) => SearchScreen(), settings: settings);
                break;
              case 'conversation':
                return CupertinoPageRoute(
                    builder: (_) => ConversationScreen(), settings: settings);
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
              case 'Mating/PetReviews':
                return CupertinoPageRoute(
                    builder: (_) => PetReviewsScreen(), settings: settings);
              default:
                return null;
            }
          },
          title: 'PetMatch',
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                textStyle: TextStyle(
                    fontFamily: "Roboto", color: PetsTheme.blackTextColor)),
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
        ));
  }
}
