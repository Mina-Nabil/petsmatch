
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';

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
        fieldsWidth = MediaQuery.of(context).size.width * .7;
      }

    return Container(
      alignment: Alignment.center,
      width: fieldsWidth,
      margin: EdgeInsets.all(PetsTheme.getLargerPadMarg(context)),
      constraints: BoxConstraints(maxWidth: fieldsWidth, maxHeight: MediaQuery.of(context).size.height*0.07),
      decoration: BoxDecoration(color: PetsTheme.whiteBarColor, border: Border.all(color: PetsTheme.petsBlueColor), borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont(context))),
      child: FlatButton(
        onPressed: callBackFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: FittedBox(
                  child: Text(
                    buttonText,
                    style:
                        TextStyle(color: PetsTheme.currentMainColor, fontFamily: "Roboto", fontWeight: FontWeight.w500, fontSize: PetsTheme.getSmallFont(context)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}