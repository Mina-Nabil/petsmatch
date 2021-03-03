import 'package:flutter/material.dart';
import 'package:petmatch/ui/profile/widgets/ProfileCover.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class ProfileScreen extends StatelessWidget {


    

  @override
  Widget build(BuildContext context) {
    

    
    return PetMatchSingleScreen(
      backArrow: true,
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max,
          children: [
            //cover
            ProfileCover(),
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height/2,
              ),
              color: Colors.grey[200],
              child: Column(
                children: [
                  NewPostWidget(),
                ],
              )
            ),
          ),
            
          ],
        ),
      )
    );
  }
}