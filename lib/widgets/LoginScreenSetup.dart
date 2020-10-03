import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/CommonScreenSetup.dart';

class LoginScreenSetup extends StatelessWidget {
  final bool showLogo;
  final Flex formWidget;
  final String topbarTitle;
  final String topbarSubtitle;
  final String formTitle;
  final String formSubtitle;
  Color textColor;
  final bgColor backgroundColor;
  final bgMask backgroundMask;
  final bool isSmallTopArea;

  LoginScreenSetup(
      {@required this.formTitle,
      @required this.topbarTitle,
      @required this.formWidget,
      this.formSubtitle = '',
      this.showLogo = true,
      this.backgroundColor = bgColor.blue,
      this.backgroundMask = bgMask.def,
      this.isSmallTopArea = false,
      this.topbarSubtitle = ''}) {
    switch (backgroundColor) {
      case bgColor.blue:
        textColor = PetsTheme.petsBlueColor;
        break;
      case bgColor.pink:
        textColor = PetsTheme.petsPinkColor;
        break;
      case bgColor.cyan:
        textColor = PetsTheme.petsCyanColor;
        break;
      case bgColor.purple:
        textColor = PetsTheme.petsPurpleColor;
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    //Screen dimentions
    final double logoMaxHeight = 0.1 * MediaQuery.of(context).size.height;

    //Widget flexes
    int formTitleFlex = 3;
    int formSubtitleFlex = 0;
    bool isFormSubtitle = false;

    if (this.formSubtitle != '') {
      formTitleFlex = 2;
      formTitleFlex = 4;
      isFormSubtitle = true;
    }

    List<Widget> topAreaWidgets = [];

    if (showLogo) {
      Widget logoWidget = Flexible(
          flex: 1,
          child: Container(
              alignment: Alignment.bottomCenter,
              constraints: BoxConstraints(maxHeight: logoMaxHeight),
              child: Hero(
                  tag: "logo",
                  child: SvgPicture.asset(
                    "assets/images/logo/orig.svg",
                    color: PetsTheme.whiteBarColor,
                  ))));
      topAreaWidgets.add(logoWidget);
    }
    Widget topTitleWidget = Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              this.topbarTitle,
              style:
                  TextStyle(fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold, fontSize: PetsTheme.getMuchLargerFont(context)),
            ),
            (this.topbarSubtitle != '')
                ? Text(
                    this.topbarSubtitle,
                    style: TextStyle(
                        fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.normal, fontSize: PetsTheme.getLargeFont(context)),
                  )
                : Container(),
          ],
        ),
      ),
    );
    topAreaWidgets.add(topTitleWidget);

    List<Widget> mainBottomAreaWidgets = [
      Flexible(
        flex: 1,
        child: Container(),
      ),
      Flexible(
        flex: formTitleFlex,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            this.formTitle,
            style: TextStyle(color: this.textColor, fontFamily: "Roboto", fontWeight: FontWeight.bold, fontSize: PetsTheme.getMuchLargerFont(context)),
          ),
        ),
      ),
    ];

    if (isFormSubtitle) {
      Widget formSubtitleWidget = Flexible(
        flex: formSubtitleFlex,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            this.formSubtitle,
            style: TextStyle(color: this.textColor, fontFamily: "Roboto", fontWeight: FontWeight.normal, fontSize: PetsTheme.getLargerFont(context)),
          ),
        ),
      );
      mainBottomAreaWidgets.add(formSubtitleWidget);
    }

    Widget bottomAreaRootWidget = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: PetsTheme.getLargestPadMarg(context)),
      child: Column(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                child: Column(
                  children: mainBottomAreaWidgets,
                ),
              )),
          Flexible(flex: 17, child: Container(child: formWidget)),
        ],
      ),
    );

    return CommonScreenSetup(
      //top Area Widget
      Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: topAreaWidgets)),

      //Bottom Area widget
      bottomAreaRootWidget,
      //Configurations
      screenBgColor: this.backgroundColor,
      screenBgMask: this.backgroundMask,
    );
  }
}
