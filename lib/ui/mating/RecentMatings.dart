import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';

class RecentMatings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset("assets/images/custom/matingPet.svg")),
        SizedBox(
          height: PetsTheme.getLargerPadMarg(),
        ),
        Text("No mates Yet!",
            style: TextStyle(
                fontSize: PetsTheme.getMeduimFont(),
                color: PetsTheme.currentMainColor)),
        SizedBox(
          height: PetsTheme.getLargerPadMarg(),
        ),
        RoundButton(
          child: FittedBox(
              child: Text(
            "Search for a mate",
            style: TextStyle(
                fontSize: PetsTheme.getMeduimFont(), color: Colors.white),
          )),
          borderColor: Colors.white,
          color: PetsTheme.currentMainColor,
          width: double.infinity, // good for SmallFont
        ),
      ],
    );
  }
}
