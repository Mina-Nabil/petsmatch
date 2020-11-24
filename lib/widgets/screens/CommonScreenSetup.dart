import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class CommonScreenSetup extends StatelessWidget {
  final Widget _topWidget;
  final Widget _bottomWidget;
  final bool isSmallTop;
  final bool isPortraitLock;
  final bool isNavBar;
  final bool isTitle;
  final bgColor screenBgColor;
  final bgMask screenBgMask;

  CommonScreenSetup(this._topWidget, this._bottomWidget,
      {this.isSmallTop = false,
      this.screenBgColor = bgColor.main,
      this.screenBgMask = bgMask.def,
      this.isPortraitLock = false,
      this.isNavBar = false,
      this.isTitle = true}) {
    PetsTheme.currentMainColor = this.screenBgColor;
  }

  @override
  Widget build(BuildContext context) {
    final double boxRadius = MediaQuery.of(context).size.width * .05;

    int topAreaFlex = 9;
    int bottomAreaFlex = 23;

    if (isSmallTop) {
      topAreaFlex = 4;
      bottomAreaFlex = 28;
    }

    return BaseScreen(
      isRightPadding: false,
      isLeftPadding: false,
      isPortraitLock: isPortraitLock,
      isBottomPadding: false,
      isTopPadding: false,
      isKeyBoardChangeSize: true,
      noTitle: !isTitle,
      isTopColorDark: false,
      isNavBar: this.isNavBar,
      backGroundColor: screenBgColor,
      backGroundMask: screenBgMask,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
              child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Upper Area space // 9 flex
                      Flexible(
                        fit: FlexFit.tight,
                        flex: topAreaFlex,
                        child: _topWidget,
                      ),

                      //Bottom Widget Area
                      Flexible(
                          flex: bottomAreaFlex,
                          fit: FlexFit.loose,
                          child: Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallestPadMarg()),
                              decoration: BoxDecoration(
                                  color: PetsTheme.petsWhiteBg,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius), topRight: Radius.circular(boxRadius))),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius), topRight: Radius.circular(boxRadius)),
                                  child: _bottomWidget)))
                    ],
                  )));
        },
      ),
    );
  }
}
