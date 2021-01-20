import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';

class SuggesionsIconsList extends StatelessWidget {
  final double listHeight;
  final double borderRadius = 20;
  final List<SuggestedIcon> suggestedList;
  SuggesionsIconsList(this.suggestedList, {this.listHeight = 185});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: PetsTheme.getMeduimPadMarg(), left: PetsTheme.getLargePadMarg()),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(borderRadius)),
      margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                    child: Text("Suggested for you", style: TextStyle(color: PetsTheme.blackTextColor, fontWeight: FontWeight.bold, fontFamily: "Roboto"))),
                FittedBox(child: Text("View All", style: TextStyle(color: PetsTheme.petsBlueColor, fontWeight: FontWeight.w500, fontFamily: "Roboto")))
              ],
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: suggestedList,
                  )))
        ],
      ),
    );
  }
}
