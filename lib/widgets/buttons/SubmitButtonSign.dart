import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/PetsButton.dart';

class SubmitButtonSign extends StatelessWidget {
  SubmitButtonSign({
    Key key,
    @required this.callBackFunction,
    this.buttonText = "Sign in",
    this.isShowPaws = true,
    this.fieldsWidth,
  }) : super(key: key);

  double fieldsWidth;
  final Function callBackFunction;
  final String buttonText;
  final bool isShowPaws;

  @override
  Widget build(BuildContext context) {
    if (fieldsWidth == null) {
      fieldsWidth = MediaQuery.of(context).size.width * .8;
    }

    return PetsButton(
      callBackFunction: callBackFunction,
      buttonText: buttonText,
      isBorder: false,
      fieldsWidth: this.fieldsWidth,
      bgColor: PetsTheme.petsGreenColor,
      textColor: Colors.white,
      trailingWidget: (isShowPaws)
          ? SvgPicture.asset(
              Paths.twoPaws_icon_file,
              color: PetsTheme.whiteBarColor,
            )
          : null,
    );
  }
}
