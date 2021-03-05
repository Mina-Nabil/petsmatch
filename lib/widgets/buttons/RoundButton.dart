import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';


class RoundButton extends StatelessWidget {

  RoundButton({
    this.child,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.borderColor = Colors.transparent
  });
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final borderColor;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    print(PetsTheme.getSmallFont());
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color, 
        border: Border.all(color: borderColor), 
        borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont())
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}