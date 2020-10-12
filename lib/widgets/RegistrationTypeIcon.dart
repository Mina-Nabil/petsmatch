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

///Custom Hero animation
///

class CustomRectTween extends RectTween {
  CustomRectTween({this.a, this.b}) : super(begin: a, end: b);
  final Rect a;
  final Rect b;

  @override
  Rect lerp( double t) {
    assert(t != null);
    if (a == null && b == null) return null;
    if (a == null) return Rect.fromLTRB(b.left * t, b.top * t, b.right * t, b.bottom * t);
    if (b == null) {
      final double k = 1.0 - t;
      return Rect.fromLTRB(a.left * k, a.top * k, a.right * k, a.bottom * k);
    }
    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, t),
      lerpDouble(a.top, b.top, t),
      lerpDouble(a.right, b.right, t),
      lerpDouble(a.bottom, b.bottom, t),
    );
  }

  double lerpDouble(num a, num b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }
}
