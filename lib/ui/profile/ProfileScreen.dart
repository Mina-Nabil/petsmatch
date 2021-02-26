import 'package:flutter/material.dart';
import 'package:petmatch/ui/profile/widgets/ProfileCover.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class ProfileScreen extends StatelessWidget {


    

  @override
  Widget build(BuildContext context) {
    

    
    return PetMatchSingleScreen(
      backArrow: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cover
           ProfileCover()
          ],
        ),
      )
    );
  }
}