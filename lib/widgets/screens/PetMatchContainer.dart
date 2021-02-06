
import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';


class PetMatchContainer extends StatelessWidget {

  PetMatchContainer({
    this.header,
    this.headerPadding = const EdgeInsets.all(20), /*equal to BorderRadius*/
    this.body,
    this.bodyPadding =  const EdgeInsets.symmetric(horizontal: 20), /*equal to BorderRadius*/
    this.bodyBackgroundColor = PetsTheme.petsWhiteBg,
  });

  final Widget header;
  final EdgeInsetsGeometry headerPadding;
  final Widget body;
  final EdgeInsetsGeometry bodyPadding;
  final Color bodyBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //header
          Container(
            padding: headerPadding,
            child: header
          ),

          //body
          Expanded(
            child: Container(
              padding: bodyPadding,
              decoration: BoxDecoration(
                color: bodyBackgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: body,
            ),
          )
        ],
      ), 
    );
  }
}