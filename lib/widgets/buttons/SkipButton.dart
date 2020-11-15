
import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/PetsButton.dart';

class SkipButton extends StatelessWidget {
  SkipButton({
    Key key,
    @required this.callBackFunction,
    this.buttonText="Skip",
    this.fieldsWidth,
  }) : super(key: key);

  double fieldsWidth;
  final Function callBackFunction;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
      if(fieldsWidth == null){
        fieldsWidth = MediaQuery.of(context).size.width * .8;
      }

    return PetsButton(callBackFunction: callBackFunction, buttonText: buttonText, textColor: PetsTheme.currentMainColor, isBorder: true, fieldsWidth: fieldsWidth,);
  }
}