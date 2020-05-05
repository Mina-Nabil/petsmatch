import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/NavBar.dart';
import 'package:petmatch/widgets/NavBarHolder.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Widget titleContainer;
  final bool isTopPadding;
  final bool isBottomPadding;
  final bool isLeftPadding;
  final bool isRightPadding;
  final bool noTitle;
  final bool isKeyBoardChangeSize;
  final String titleText;
  final Color backGroundColor;
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
      this.backGroundColor,
      this.noTitle = false,
      this.isKeyBoardChangeSize = false,
      this.isNavBar = false,
      this.titleCenter = true,
      this.isTopPadding = true,
      this.isBottomPadding = false,
      this.isLeftPadding = true,
      this.isRightPadding = true}); //Basescreen with top left right padding

  @override
  Widget build(BuildContext context) {
    double screenTopPadding =
        (isTopPadding) ? MediaQuery.of(context).size.height * .05 : 0;
    double screenBottomPadding =
        (isBottomPadding) ? MediaQuery.of(context).size.height * .03 : 0;
    double screenLeftPadding =
        (isLeftPadding) ? MediaQuery.of(context).size.width * .05 : 0;
    double screenRightPadding =
        (isRightPadding) ? MediaQuery.of(context).size.width * .05 : 0;

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: (backGroundColor) ?? PetsTheme.bgColor,
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/bg.png", fit: BoxFit.fill),
          ),
          Scaffold(
            resizeToAvoidBottomInset: isKeyBoardChangeSize,
            appBar: (titleContainer != null)
                ? PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 70),
                    child: titleContainer)
                : (!noTitle)
                    ? AppBar(
                        title: (titleText != null)
                            ? Text(this.titleText,
                                style: (this.titleStyle) ??
                                    TextStyle(
                                        fontFamily: "Oregano",
                                        fontSize:
                                            PetsTheme.getLargerFont(context)))
                            : Text(""),

                        centerTitle: titleCenter,
                        bottom: (subTitle) ?? subTitle,
                        backgroundColor:
                            PetsTheme.darkBgColor, // status bar color,
                        brightness: Brightness.dark, // status text bar color
                      )
                    : PreferredSize(
                        preferredSize: Size(0, 0),
                        child: AppBar(
                          elevation: 0,
                          backgroundColor:
                              Colors.transparent, // status bar color,
                          brightness: Brightness.light,
                        )),
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.only(
                    top: screenTopPadding,
                    left: screenLeftPadding,
                    right: screenRightPadding,
                    bottom: screenBottomPadding),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: child ?? child),
            bottomNavigationBar: (isNavBar) ? NavBarHolder() : null,
          ),
        ]));
  }
}
