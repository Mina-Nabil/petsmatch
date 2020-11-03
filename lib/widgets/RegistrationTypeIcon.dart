import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/theme/petsTheme.dart';

class RegistrationTypeButton extends StatelessWidget {
  final String iconPath;
  final String iconCaption;
  final Color iconColor;
  final Color bgColor;
  final bool isHidden;

  RegistrationTypeButton(this.iconPath, this.iconCaption, this.iconColor, this.bgColor, {this.isHidden=false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
        tag: this.iconCaption,
        transitionOnUserGestures: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: PetsTheme.getMuchLargerPadMarg(context), left: PetsTheme.getMeduimPadMarg(context), right: PetsTheme.getMeduimPadMarg(context)),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (this.isHidden) ? Colors.transparent : this.bgColor.withOpacity(.2),
                ),
                child: Container(
                  child: FractionallySizedBox(
                    heightFactor: 0.65,
                    widthFactor: 0.65,
                    child: SvgPicture.asset(
                      this.iconPath,
                      color: (this.isHidden) ? Colors.transparent : this.iconColor,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: PetsTheme.getLargePadMarg(context)),
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: Text(
                      iconCaption,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          decoration: TextDecoration.none,
                          fontSize: PetsTheme.getSmallFont(context),
                          fontWeight: FontWeight.w700,
                          color: (this.isHidden) ? Colors.transparent : PetsTheme.blackTextColor),
                    ),
                  ),
                ))
          ],
        ));
  }
}


