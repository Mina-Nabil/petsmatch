import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({
    Key key,
    @required this.callBackFunction,
    this.buttonText = "Let's Go",
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
      fieldsWidth = MediaQuery.of(context).size.width * .7;
    }

    return Container(
      alignment: Alignment.center,
      width: fieldsWidth,
      height: MediaQuery.of(context).size.height * 0.07,
      margin: EdgeInsets.all(PetsTheme.getSmallerPadMarg(context)),
      constraints: BoxConstraints(maxWidth: fieldsWidth, maxHeight: MediaQuery.of(context).size.height * 0.07),
      decoration: BoxDecoration(color: PetsTheme.petsGreenColor, borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont(context))),
      child: FlatButton(
        onPressed: callBackFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (isShowPaws)
                ? Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg(context)),
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                          child: SvgPicture.asset(
                        Paths.twoPaws_icon_file,
                        color: PetsTheme.whiteBarColor,
                      )),
                    ),
                  )
                : Flexible(flex: 2, fit: FlexFit.tight, child: Container()),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.all(PetsTheme.getMeduimPadMarg(context)),
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.white, fontFamily: "Roboto", fontWeight: FontWeight.w500, fontSize: PetsTheme.getSmallFont(context)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
