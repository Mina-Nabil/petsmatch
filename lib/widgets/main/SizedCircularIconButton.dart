import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';

class SizedCircularIconButton extends StatelessWidget {
  final String iconPath;
  final Color bgColor;
  final Color iconColor;
  final Function buttonCallback;
  final double circleDiameter;

  const SizedCircularIconButton({
    @required this.iconPath,
    @required this.iconColor,
    @required this.buttonCallback,
    this.bgColor = Colors.transparent,
    this.circleDiameter = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 40,
      height: 0,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: buttonCallback,
        child: Container(
          width: circleDiameter,
          margin: EdgeInsets.symmetric(horizontal:PetsTheme.getSmallPadMarg()),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(iconPath, color: iconColor),
        ),
      ),
    );
  }
}
