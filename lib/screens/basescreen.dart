import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/NavBarHolder.dart';
import 'package:flutter/gestures.dart';



class BaseScreen extends StatefulWidget {
  ////SCREEN DEFAULTS
  static final topPaddingPercentage = 0.05;
  static final bottomPaddingPercentage = 0.03;
  static final rightPaddingPercentage = 0.05;
  static final leftPaddingPercentage = 0.05;

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
  final bool isPortraitLock;
  BaseScreen(
      {this.child,
      this.titleText,
      this.titleStyle,
      this.subTitle,
      this.titleContainer,
      this.backGroundColor = bgColor.main,
      this.backGroundMask = bgMask.def,
      this.noTitle = false,
      this.isTopColorDark = false,
      this.isKeyBoardChangeSize = false,
      this.isNavBar = false,
      this.isPortraitLock = false,
      this.titleCenter = true,
      this.isTopPadding = true,
      this.isBottomPadding = false,
      this.isLeftPadding = true,
      this.isRightPadding = true});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  Container bgMaskContainer;
  String bgMaskPath;
  Image bgMaskImage;

  @override
  void initState() {
    super.initState();
  

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
      color: PetsTheme.currentBgMainColor.withOpacity(1.0),
      colorBlendMode: BlendMode.srcOut,
    );
    Future.delayed(Duration.zero).then((_) {
      precacheImage(bgMaskImage.image, context);
    });

    if (widget.isPortraitLock)
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    else
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenTopPadding = (widget.isTopPadding) ? MediaQuery.of(context).size.height * BaseScreen.topPaddingPercentage : 0;
    double screenBottomPadding = (widget.isBottomPadding) ? MediaQuery.of(context).size.height * BaseScreen.bottomPaddingPercentage : 0;
    double screenLeftPadding = (widget.isLeftPadding) ? MediaQuery.of(context).size.width * BaseScreen.leftPaddingPercentage : 0;
    double screenRightPadding = (widget.isRightPadding) ? MediaQuery.of(context).size.width * BaseScreen.rightPaddingPercentage : 0;

    PreferredSizeWidget appBar = (widget.titleContainer != null)
        ? PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width, 70), child: widget.titleContainer)
        : (!widget.noTitle)
            ? AppBar(
                elevation: 0.0,
                title: (widget.titleText != null)
                    ? Text(this.widget.titleText,
                        style: (this.widget.titleStyle) ?? TextStyle(fontFamily: "Oregano", fontSize: PetsTheme.getLargerFont(context)))
                    : Text(""),

                centerTitle: widget.titleCenter,
                bottom: (widget.subTitle) ?? widget.subTitle,
                backgroundColor: Colors.transparent, // status bar color,
                brightness: (this.widget.isTopColorDark) ? Brightness.light : Brightness.dark, // status text bar color
              )
            : PreferredSize(
                preferredSize: Size(0, 0),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent, // status bar color,
                  brightness: (this.widget.isTopColorDark) ? Brightness.light : Brightness.dark,
                ));

    List<Widget> stackWidgets = [
      Container(color: PetsTheme.currentBgMainColor, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: bgMaskImage),
      Scaffold(
        resizeToAvoidBottomInset: widget.isKeyBoardChangeSize,
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: screenTopPadding, left: screenLeftPadding, right: screenRightPadding, bottom: screenBottomPadding),
            color: Colors.transparent,
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height - appBar.preferredSize.height, maxWidth: MediaQuery.of(context).size.width),
            child: widget.child ?? widget.child),
      ),
    ];

    if (widget.isNavBar) stackWidgets.add(NavBarHolder());

    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomStack(alignment: Alignment.bottomCenter, children: stackWidgets, isNavBar: widget.isNavBar));
  }
}

class CustomStack extends Stack {
  final bool isNavBar;

  CustomStack({alignment, children, this.isNavBar = false}) : super(children: children, alignment: alignment);

  @override
  CustomRenderStack createRenderObject(BuildContext context) {
    return CustomRenderStack(
        alignment: alignment,
        textDirection: textDirection ?? Directionality.of(context),
        fit: fit,
        isNavBar: isNavBar,
        screenSize: MediaQuery.of(context).size);
  }
}

class CustomRenderStack extends RenderStack {
  CustomRenderStack({alignment, textDirection, fit, overflow, this.isNavBar, this.screenSize})
      : super(alignment: alignment, textDirection: textDirection, fit: fit);

  bool isNavBar;
  Size screenSize;

  bool isRealNavArea(Size size, Offset position) {
    //checks whether the hit is in the real nav buttons or no
    if (position.dy > size.height * (1 - NavBarHolder.navBarContainerHeight) && !NavBarHolder.expanded) {
      // if bottom nav bar{
      print("ana fl awel");
      return true;
    }
    double firstLimit = size.width * NavBarHolder.xStart;
    double endLimit = size.width * NavBarHolder.xEnd;
    double expandedFirstLimit = size.width * NavBarHolder.xExpandedStart;
    double expandedEndLimit = size.width * NavBarHolder.xExpandedEnd;
    if (position.dx > expandedFirstLimit &&
        position.dx < expandedEndLimit &&
        NavBarHolder.expanded &&
        (position.dy > size.height * (1 - NavBarHolder.navBarHeight))) {
      print("Ana hena");
      return true;
    }
    if (position.dx > firstLimit &&
        position.dx < endLimit &&
        !NavBarHolder.expanded &&
        (position.dy > size.height * (1 - 1.5 * NavBarHolder.navBarContainerHeight))) {
      print("ANa henak");
      return true;
    }
    return false;
  }

  bool isNavArea(Size size, Offset position) {
    //checks whether the hit is in the whole Nav Contaier Area or no

    if (position.dy > size.height * (1 - NavBarHolder.navBarHeight)) //hit under the bar
    {
      print("Ana Nav");
      return true;
    } else {
      print("Ana Msh Nav");
      return false;
    }
  }

  bool isLayersPassed(int currentLayer) {
    const layersMax = 0;
    print(currentLayer);
    return (currentLayer > layersMax);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    int layers = 0;

    RenderBox child = lastChild;
    while (child != null) {
      final StackParentData childParentData = child.parentData as StackParentData;
      final bool isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          assert(transformed == position - childParentData.offset);
          // return child.hitTest(result, position: transformed);
          if (!isNavBar) {
            return child.hitTest(result, position: transformed);
          } else if (isNavArea(size, position)) {
            if (isRealNavArea(size, position)) {
              print("Bas real");
              return child.hitTest(result, position: transformed);
            } else if (!isLayersPassed(layers++)) {
              print("Lsa msh Passed");
              return false;
            } else {
              print("Passed");
              return child.hitTest(result, position: transformed);
            }
          } else {
            return child.hitTest(result, position: transformed);
          }
        },
      );
      if (isHit) return true;
      child = childParentData.previousSibling;
    }
    return false;
  }
}
