import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/CommonScreenSetup.dart';

class LoginScreenSetup extends StatelessWidget {
  final bool showLogo;
  final Flex formWidget;
  final String topbarTitle;
  final String topbarSubtitle;
  final String formTitle;
  final String formSubtitle;
  final bgColor backgroundColor;
  final bgMask backgroundMask;
  final bool isSmallTopArea;
  final bool isBottomScrollable;
  final bool smalFormTitle;
  final Alignment formTitleAlignment;
  final TextAlign formTitleTextAlignment;
  final bool isPortraitLock;

  LoginScreenSetup(
      {
      @required this.topbarTitle,
      @required this.formWidget,
      this.formTitle = '',
      this.formSubtitle = '',
      this.showLogo = true,
      this.backgroundColor = bgColor.main,
      this.backgroundMask = bgMask.def,
      this.isSmallTopArea = false,
      this.smalFormTitle = false,
      this.isPortraitLock = false,
      this.isBottomScrollable = false,
      this.formTitleAlignment = Alignment.center,
      this.formTitleTextAlignment = TextAlign.center,
      this.topbarSubtitle = ''}) ;
  @override
  Widget build(BuildContext context) {
    //Screen dimentions
    final double logoMaxHeight = 0.1 * MediaQuery.of(context).size.height;

    //Widget flexes
    int formTitleFlex = 3;
    int formSubtitleFlex = 0;
    bool isFormSubtitle = false;
    bool isFormTitle = false;

    if (this.formSubtitle != '') {
      formTitleFlex = 2;
      formTitleFlex = 4;
      isFormSubtitle = true;
    }

    if(this.formTitle != '') {
      isFormTitle = true;
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
                  child: SizedBox(
                    child: SvgPicture.asset(
                      "assets/images/logo/orig.svg",
                      color: PetsTheme.whiteBarColor,
                    ),
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
            Flexible(
              flex: 2,
              child: FittedBox(
                child: Text(
                  this.topbarTitle,
                  style: TextStyle(
                      fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold, fontSize: PetsTheme.getEvenMuchLargerFont()),
                ),
              ),
            ),
            (this.topbarSubtitle != '')
                ? Flexible(
                    flex: 1,
                    child: SizedBox(
                      child: Text(
                        this.topbarSubtitle,
                        style: TextStyle(
                            fontFamily: "Roboto", color: PetsTheme.whiteBarColor, fontWeight: FontWeight.normal, fontSize: PetsTheme.getLargeFont()),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
    topAreaWidgets.add(topTitleWidget);

    List<Widget> formTitleAreaWidgets = [
      Flexible(
        flex: 1,
        child: Container(),
      ),
      (isFormTitle) ? 
      Flexible(
        flex: formTitleFlex,
        child: Container(
          alignment: formTitleAlignment,
          child: SizedBox(
            child: Text(
              this.formTitle,
              textAlign: formTitleTextAlignment,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: PetsTheme.currentMainColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: (!this.smalFormTitle) ? PetsTheme.getMuchLargerFont() : PetsTheme.getMeduimFont()),
            ),
          ),
        ),
      ) :  Container(),
    ];

    if (isFormSubtitle) {
      Widget formSubtitleWidget = Flexible(
        flex: formSubtitleFlex,
        child: Container(
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              this.formSubtitle,
              style:
                  TextStyle(color: PetsTheme.currentMainColor, fontFamily: "Roboto", fontWeight: FontWeight.normal, fontSize: PetsTheme.getMeduimFont()),
            ),
          ),
        ),
      );
      formTitleAreaWidgets.add(formSubtitleWidget);
    }

    Widget bottomAreaRootWidget = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: PetsTheme.getLargestPadMarg()),
      child: Column(
        children: [
          Flexible(
              flex: 4,
              child: Container(
                child: Column(
                  children: formTitleAreaWidgets,
                ),
              )),
          Flexible(
              flex: 17,
              child: (!isBottomScrollable)
                  ? Container(child: formWidget)
                  : SingleChildScrollView(
                      child: Container(
                        //  height: MediaQuery.of(context).size.height,
                        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*4),
                        child: formWidget,
                      ),
                    )),
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
      isSmallTop: this.isSmallTopArea,
      isPortraitLock: isPortraitLock,
    );
  }
}
