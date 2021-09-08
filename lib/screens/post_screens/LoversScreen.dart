// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:petmatch/models/Pet.dart';
// import 'package:petmatch/models/User.dart';
// import 'package:petmatch/widgets/feed/UserNameRole.dart';
// import 'package:petmatch/widgets/main/UserAvatar.dart';
// import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
// import 'package:petmatch/theme/petsTheme.dart';

// class LoversScreen extends StatefulWidget {
//   @override
//   _SearchScreen createState() => _SearchScreen();
// }

// class _SearchScreen extends State<LoversScreen> {

//   List<User> lovers = [
//     User("Mina","https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw", "hamada@pets",
//     pets: [Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),] ),
//     User("Ayman","https://www.leisureopportunities.co.uk/images/995586_746594.jpg", "hamada@pets",
//     pets: [Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),] ),
//     User("Phil","https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw", "hamada@pets",
//     pets: [Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),] ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return PetMatchSingleScreen(
//       backArrow: true,
//       title: Text("${lovers.length} Loves",
//               style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
//           ),
//       bodyBackgroundColor: Colors.white,
//       body: ListView.builder(
//         padding: EdgeInsets.zero,
//           itemCount: lovers.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 ListTile(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   leading: Container(
//                     width: 45,
//                     height: 45,
//                     child: UserAvatar(image: lovers[index].image, imageRatio: 1,)
//                   ),
//                   title: UserNameRole(name: lovers[index].name, role: lovers[index].whoIAm())
//                 ),
//                 Divider(height: 0, thickness: 1,indent: 20, endIndent: 20,)
//               ],
//             );
//           }

//       ),
//     );
//   }
// }
