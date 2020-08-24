import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/NavBar.dart';
import 'package:petmatch/widgets/NavBarHolder.dart';

//Declaring background mask and colors enums
enum bgColor { blue, purple, cyan, pink }
enum bgMask { def, mating, training, walk, services }

class BaseScreen extends StatefulWidget {
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
      this.isRightPadding = true});
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  Color bgColorRGB;
  Container bgMaskContainer;
  String bgMaskPath;
  Image bgMaskImage;

  @override
  void initState() {
    super.initState();

    switch (this.widget.backGroundColor) {
      case bgColor.blue:
        bgColorRGB = PetsTheme.petsBgBlueColor;
        break;
      case bgColor.purple:
        bgColorRGB = PetsTheme.petsBgPurpleColor;
        break;
      case bgColor.pink:
        bgColorRGB = PetsTheme.petsBgPinkColor;
        break;
      case bgColor.cyan:
        bgColorRGB = PetsTheme.petsBgCyanColor;
        break;
      default: //blue background
        bgColorRGB = PetsTheme.petsBgBlueColor;
    }

    switch (this.widget.backGroundMask) {
      case bgMask.def:
        bgMaskPath = "assets/images/masks/def_blue.png";
        break;
      case bgMask.mating:
        bgMaskPath = "assets/images/masks/mating.png";
        break;
      case bgMask.services:
        bgMaskPath = "assets/images/masks/services.png";
        break;
      case bgMask.training:
        bgMaskPath = "assets/images/masks/training.png";
        break;
      case bgMask.walk:
        bgMaskPath = "assets/images/masks/walk.png";
        break;
    }

    bgMaskImage = Image.asset(
      bgMaskPath,
      fit: BoxFit.cover,
      color: bgColorRGB.withOpacity(.9),
      colorBlendMode: BlendMode.srcOut,
    );
    Future.delayed(Duration.zero).then((_) {
      precacheImage(bgMaskImage.image, context);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenTopPadding = (widget.isTopPadding) ? MediaQuery.of(context).size.height * .05 : 0;
    double screenBottomPadding = (widget.isBottomPadding) ? MediaQuery.of(context).size.height * .03 : 0;
    double screenLeftPadding = (widget.isLeftPadding) ? MediaQuery.of(context).size.width * .05 : 0;
    double screenRightPadding = (widget.isRightPadding) ? MediaQuery.of(context).size.width * .05 : 0;

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          Container(color: bgColorRGB, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: bgMaskImage),
          Scaffold(
            resizeToAvoidBottomInset: widget.isKeyBoardChangeSize,
            appBar: (widget.titleContainer != null)
                ? PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 70), child: widget.titleContainer)
                : (!widget.noTitle)
                    ? AppBar(
                        title: (widget.titleText != null)
                            ? Text(this.widget.titleText,
                                style: (this.widget.titleStyle) ?? TextStyle(fontFamily: "Oregano", fontSize: PetsTheme.getLargerFont(context)))
                            : Text(""),

                        centerTitle: widget.titleCenter,
                        bottom: (widget.subTitle) ?? widget.subTitle,
                        backgroundColor: PetsTheme.darkBgColor, // status bar color,
                        brightness: Brightness.dark, // status text bar color
                      )
                    : PreferredSize(
                        preferredSize: Size(0, 0),
                        child: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent, // status bar color,
                          brightness: (this.widget.isTopColorDark) ? Brightness.light : Brightness.dark,
                        )),
            backgroundColor: Colors.transparent,
            body: Container(
                padding: EdgeInsets.only(top: screenTopPadding, left: screenLeftPadding, right: screenRightPadding, bottom: screenBottomPadding),
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: widget.child ?? widget.child),
            bottomNavigationBar: (widget.isNavBar) ? NavBarHolder() : null,
          ),
        ]));
  }
}
