import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/NavBar.dart';
import 'package:petmatch/widgets/NavBarHolder.dart';

//Declaring background mask and colors enums
enum bgColor { blue, purple, cyan, pink }
enum bgMask { def, mating, training, walk, services }

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Widget titleContainer;
  final bool isTopColorDark;
  final bool isTopPadding;
  final bool isBottomPadding;
  final bool isLeftPadding;
  final bool isRightPadding;
  final bool noTitle;
  final bool isKeyBoardChangeSize;
  final String titleText;
  final bgColor backGroundColor;
  final bgMask backGroundMask;
  final TextStyle titleStyle;
  final bool titleCenter;
  final bool isNavBar;
  final PreferredSizeWidget subTitle;

  BaseScreen(
      {this.child,
      this.titleText,
      this.titleStyle,
      this.subTitle,
      this.titleContainer,
      this.backGroundColor = bgColor.blue,
      this.backGroundMask = bgMask.def,
      this.noTitle = false,
      this.isTopColorDark = false,
      this.isKeyBoardChangeSize = false,
      this.isNavBar = false,
      this.titleCenter = true,
      this.isTopPadding = true,
      this.isBottomPadding = false,
      this.isLeftPadding = true,
      this.isRightPadding = true}); //Basescreen with top left right padding

  @override
  Widget build(BuildContext context) {
    double screenTopPadding = (isTopPadding) ? MediaQuery.of(context).size.height * .05 : 0;
    double screenBottomPadding = (isBottomPadding) ? MediaQuery.of(context).size.height * .03 : 0;
    double screenLeftPadding = (isLeftPadding) ? MediaQuery.of(context).size.width * .05 : 0;
    double screenRightPadding = (isRightPadding) ? MediaQuery.of(context).size.width * .05 : 0;

    Container bgColorContainer;
    Container bgMaskContainer;

    switch (this.backGroundColor) {
      case bgColor.blue:
        bgColorContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: PetsTheme.petsBgBlueColor,
        );
        break;
      case bgColor.purple:
        bgColorContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: PetsTheme.petsBgPurpleColor,
        );
        break;
      case bgColor.pink:
        bgColorContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: PetsTheme.petsBgPinkColor,
        );
        break;
      case bgColor.cyan:
        bgColorContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: PetsTheme.petsBgCyanColor,
        );
        break;
      default: //blue background
        bgColorContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          color: PetsTheme.petsBgBlueColor,
        );
    }

    switch (this.backGroundMask) {
      case bgMask.def:
        bgMaskContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new  Image.asset("assets/images/masks/def_blue.png", fit: BoxFit.cover, color: bgColorContainer.color.withOpacity(.9), colorBlendMode: BlendMode.srcOut, )
        );
        break;
      case bgMask.mating:
        bgMaskContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Image.asset("assets/images/masks/mating.png", fit: BoxFit.cover, color: bgColorContainer.color.withOpacity(.9), colorBlendMode: BlendMode.srcOut,)
        );
        break;
      case bgMask.services:
        bgMaskContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Image.asset("assets/images/masks/services.png", fit: BoxFit.cover, color: bgColorContainer.color.withOpacity(.9), colorBlendMode: BlendMode.srcOut,)
        );
        break;
      case bgMask.training:
        bgMaskContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Image.asset("assets/images/masks/training.png", fit: BoxFit.cover, color: bgColorContainer.color.withOpacity(.9), colorBlendMode: BlendMode.srcOut,)
        );
        break;
      case bgMask.walk:
        bgMaskContainer = new Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: new Image.asset("assets/images/masks/walk.png", fit: BoxFit.cover, color: bgColorContainer.color.withOpacity(.9), colorBlendMode: BlendMode.srcOut,)
        );
        break;
    }

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          bgColorContainer,
          bgMaskContainer,
          Scaffold(
            resizeToAvoidBottomInset: isKeyBoardChangeSize,
            appBar: (titleContainer != null)
                ? PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 70), child: titleContainer)
                : (!noTitle)
                    ? AppBar(
                        title: (titleText != null)
                            ? Text(this.titleText, style: (this.titleStyle) ?? TextStyle(fontFamily: "Oregano", fontSize: PetsTheme.getLargerFont(context)))
                            : Text(""),

                        centerTitle: titleCenter,
                        bottom: (subTitle) ?? subTitle,
                        backgroundColor: PetsTheme.darkBgColor, // status bar color,
                        brightness: Brightness.dark, // status text bar color
                      )
                    : PreferredSize(
                        preferredSize: Size(0, 0),
                        child: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent, // status bar color,
                          brightness: (this.isTopColorDark) ? Brightness.light : Brightness.dark,
                        )),
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.only(top: screenTopPadding, left: screenLeftPadding, right: screenRightPadding, bottom: screenBottomPadding),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: child ?? child),
            bottomNavigationBar: (isNavBar) ? NavBarHolder() : null,
          ),
        ]));
  }
}
