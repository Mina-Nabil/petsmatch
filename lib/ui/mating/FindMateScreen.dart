import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class FindMateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      title: Text("Bella is looking for a Make",style: TextStyle(
              fontSize: PetsTheme.getLargerFont(),
              color: Colors.white,
              fontWeight: FontWeight.bold)),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Placeholder()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          Text("Coco"),
                          Text("location"),
                          ]
                        ),
                        CircularButton(
                          child: SvgPicture.asset('assets/images/icons/mating/matingLove.svg'),
                          radius: PetsTheme.radius3,
                          backgroundColor: Colors.red[50], 
                          onPressed: null
                        )
                      ],
                    ),
                  ),
                  Text("View profile"),
                  Row(
                    children: [
                      Flexible(flex: 2, child: Container(margin: EdgeInsets.only(right: PetsTheme.getSmallPadMarg()), color: PetsTheme.commentBgColor, height: 50,)),
                      Flexible(flex: 1, child: Container(margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),color: PetsTheme.commentBgColor, height: 50,)),
                      Flexible(flex: 1, child: Container(margin: EdgeInsets.only(left: PetsTheme.getSmallPadMarg()),color: PetsTheme.commentBgColor, height: 50,)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}