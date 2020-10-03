import 'package:flutter/material.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class CommonScreenSetup extends StatelessWidget {
  final Widget _topWidget;
  final Widget _bottomWidget;
  final bool isSmallTop;
  final bgColor screenBgColor;
  final bgMask screenBgMask;

  CommonScreenSetup(this._topWidget, this._bottomWidget, {this.isSmallTop = false, this.screenBgColor=bgColor.blue, this.screenBgMask=bgMask.def});

  @override
  Widget build(BuildContext context) {
    final double boxRadius = MediaQuery.of(context).size.width * .075;

    int topAreaFlex = 9;
    int bottomAreaFlex = 23;

    if (isSmallTop) {
      topAreaFlex = 6;
      bottomAreaFlex = 26;
    }

    return BaseScreen(
      isRightPadding: false,
      isLeftPadding: false,
      isBottomPadding: false,
      isTopPadding: false,
      isKeyBoardChangeSize: true,
      noTitle: false,
      isTopColorDark: false,
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

                      //Spacing in the middle - 1 flex
                      Flexible(child: Container(), flex: 1),

                      //Bottom Widget Area
                      Flexible(
                          flex: bottomAreaFlex,
                          fit: FlexFit.tight,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallestPadMarg(context)),
                            decoration: BoxDecoration(
                                color: PetsTheme.whiteBarColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius), topRight: Radius.circular(boxRadius))),
                            child: _bottomWidget,
                          ))
                    ],
                  )));
        },
      ),
    );
  }
}
