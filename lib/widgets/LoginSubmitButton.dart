
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';

class LoginSubmitButton extends StatelessWidget {
  LoginSubmitButton({
    Key key,
    @required this.callBackFunction,
    this.fieldsWidth=null,
  }) : super(key: key);

  double fieldsWidth;
  final Function callBackFunction;

  @override
  Widget build(BuildContext context) {
      if(fieldsWidth == null){
        fieldsWidth = MediaQuery.of(context).size.width * .7;
      }

    return Container(
      alignment: Alignment.center,
      width: fieldsWidth,

      constraints: BoxConstraints(maxWidth: fieldsWidth, maxHeight: MediaQuery.of(context).size.height*0.07),
      decoration: BoxDecoration(color: PetsTheme.petsGreenColor, borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont(context))),
      child: FlatButton(
        onPressed: callBackFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg(context)),
                  child: SizedBox(
                      child: SvgPicture.asset(
                    Paths.twoPaws_icon_file,
                    color: PetsTheme.whiteBarColor,
                  )),
                )),
            Flexible(
                flex: 1,
                child: SizedBox(
                  child: Text(
                    "Let's go",
                    style:
                        TextStyle(color: Colors.white, fontFamily: "Roboto", fontWeight: FontWeight.w500, fontSize: PetsTheme.getSmallFont(context)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}