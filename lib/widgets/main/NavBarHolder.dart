import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/NavBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarHolder extends StatefulWidget {
  //original scale
  static final double navBarMargin = .01;

  static final double navBarInnerHeightPos = 1 - PetsTheme.getNavBarInnerHeight();
  static final double navBarContainerHeight = PetsTheme.getNavBarInnerHeight() * PetsTheme.getNavBarHeight();
  static final double navBarButtonPadding = .01;

  static final double pawBegin = 0;
  static final double pawEnd = 1;

  //paw circles ratio
  //all circles ratios
  static final double yEnd = 0.1;
  static final double xStart = 0.4;
  static final double xEnd = 0.6;
  static final double xExpandedStart = 0.2;
  static final double xExpandedEnd = 0.8;

  //first circle (base left)
  static final double xBaseLeftStart = 0.26;
  static final double xBaseLeftEnd = 0.4;
  static final double yBaseLeftStart = 0.07;
  static final double yBaseLeftEnd = 0.13;

  //second circle (upper left)
  static final double xUpperLeftStart = 0.34;
  static final double xUpperLeftEnd = 0.48;
  static final double yUpperLeftStart = 0;
  static final double yUpperLeftEnd = 0.07;

  //third circle (upper right)
  static final double xUpperRightStart = 0.50;
  static final double xUpperRightEnd = 0.64;
  static final double yUpperRightStart = 0;
  static final double yUpperRightEnd = 0.07;

  //fourth circle (base right)
  static final double xBaseRightStart = 0.58;
  static final double xBaseRightEnd = 0.74;
  static final double yBaseRightStart = 0.07;
  static final double yBaseRightEnd = 0.13;

  static bool expanded = false;

  Function baseLeftCallback;
  Function upperLeftCallback;
  Function upperRightCallback;
  Function baseRightCallback;

  NavBarHolder(
      {@required Function servicesCallback, @required Function trainingCallback, @required Function matingCallback, @required Function walkingCallback}) {
    this.baseLeftCallback = servicesCallback;
    this.upperLeftCallback = trainingCallback;
    this.upperRightCallback = matingCallback;
    this.baseRightCallback = walkingCallback;
  }

  @override
  _NavBarHolderState createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> with SingleTickerProviderStateMixin {
  ///animations
  Animation<double> _pawScale;

  AnimationController _pawController;
  ui.Image serviceImage;
  ui.Image trainingImage;
  ui.Image walkingImage;
  ui.Image matingImage;
  bool areImagesLoaded = false;
  @override
  void initState() {
    super.initState();
    _pawController = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _pawScale = Tween<double>(begin: NavBarHolder.pawBegin, end: NavBarHolder.pawEnd).animate(CurvedAnimation(parent: _pawController, curve: Curves.linear));

    Future.delayed(Duration.zero).then((_) async {
      serviceImage = await loadSvgImage(Paths.services_icon_svg_file, dimensions: 62.0);
      trainingImage = await loadSvgImage(Paths.training_icon_svg_file);
      walkingImage = await loadSvgImage(Paths.walking_icon_svg_file);
      matingImage = await loadSvgImage(Paths.mating_icon_svg_file, dimensions: 89.5);
      setState(() {
        areImagesLoaded = true;
      });
    });
  }

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }

  Future<ui.Image> loadSvgImage(String path, {dimensions = 120.0}) async {
    double imageDimension = dimensions;
    String rawSvg = await rootBundle.loadString(path);
    DrawableRoot drawableSvg = await svg.fromSvgString(rawSvg, rawSvg);
    ui.Picture p = drawableSvg.toPicture(size: Size(imageDimension, imageDimension));
    return p.toImage(imageDimension.toInt(), imageDimension.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pawScale,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height * PetsTheme.getNavBarHeight(),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * NavBarHolder.navBarMargin),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              (areImagesLoaded)
                  ? CustomPaint(
                      painter: NavBar(
                          _pawScale.value, NavBarHolder.navBarInnerHeightPos, NavBarHolder.expanded, serviceImage, trainingImage, walkingImage, matingImage),
                      child: GestureDetector(behavior: HitTestBehavior.opaque, onTapUp: navTapHandle),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  bool _itIsHome(TapUpDetails upDetails) {
    double heightLimit = MediaQuery.of(context).size.height * NavBarHolder.yEnd;
    double firstLimit = MediaQuery.of(context).size.width * NavBarHolder.xStart;
    double endLimit = MediaQuery.of(context).size.width * NavBarHolder.xEnd;
    double expanedFirstLimit = MediaQuery.of(context).size.width * NavBarHolder.xExpandedStart;
    double expandedEndLimit = MediaQuery.of(context).size.width * NavBarHolder.xExpandedEnd;
    bool isTapped = (upDetails.localPosition.dx > firstLimit &&
            upDetails.localPosition.dx < endLimit &&
            heightLimit < upDetails.localPosition.dy &&
            !NavBarHolder.expanded) ||
        (upDetails.localPosition.dx > expanedFirstLimit && upDetails.localPosition.dx < expandedEndLimit && NavBarHolder.expanded);
    return isTapped;
  }

  bool _itIsBaseLeft(TapUpDetails upDetails) {
    double startHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yBaseLeftStart;
    double endHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yBaseLeftEnd;
    double startWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xBaseLeftStart;
    double endWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xBaseLeftEnd;

    return _isCircle(upDetails, startWidthLimit, endWidthLimit, startHeightLimit, endHeightLimit);
  }

  bool _itIsUpperLeft(TapUpDetails upDetails) {
    double startHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yUpperLeftStart;
    double endHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yUpperLeftEnd;
    double startWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xUpperLeftStart;
    double endWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xUpperLeftEnd;

    return _isCircle(upDetails, startWidthLimit, endWidthLimit, startHeightLimit, endHeightLimit);
  }

  bool _itIsUpperRight(TapUpDetails upDetails) {
    double startHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yUpperRightStart;
    double endHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yUpperRightEnd;
    double startWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xUpperRightStart;
    double endWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xUpperRightEnd;

    return _isCircle(upDetails, startWidthLimit, endWidthLimit, startHeightLimit, endHeightLimit);
  }

  bool _itIsBaseRight(TapUpDetails upDetails) {
    double startHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yBaseRightStart;
    double endHeightLimit = MediaQuery.of(context).size.height * NavBarHolder.yBaseRightEnd;
    double startWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xBaseRightStart;
    double endWidthLimit = MediaQuery.of(context).size.width * NavBarHolder.xBaseRightEnd;

    return _isCircle(upDetails, startWidthLimit, endWidthLimit, startHeightLimit, endHeightLimit);
  }

  bool _isCircle(TapUpDetails upDetails, double startWidthLimit, double endWidthLimit, double startHeightLimit, double endHeightLimit) {

    bool isTapped = (upDetails.localPosition.dx > startWidthLimit &&
        upDetails.localPosition.dx < endWidthLimit &&
        startHeightLimit < upDetails.localPosition.dy &&
        endHeightLimit > upDetails.localPosition.dy &&
        NavBarHolder.expanded);

    return (isTapped);
  }

  void shrinkPaw() {
    _pawController.reverse();
    setState(() {
      NavBarHolder.expanded = false;
    });
  }

  void expandPaw() {
    _pawController.forward();
    setState(() {
      NavBarHolder.expanded = true;
    });
  }

  void togglePaw() {
    if (NavBarHolder.expanded)
      shrinkPaw();
    else
      expandPaw();
  }

  void navTapHandle(TapUpDetails upDetails) {
    if (_itIsBaseLeft(upDetails)) {
      widget.baseLeftCallback();
    }
    if (_itIsUpperLeft(upDetails)) {
      widget.upperLeftCallback();
    }

    if (_itIsUpperRight(upDetails)) {
      widget.upperRightCallback();
    }

    if (_itIsBaseRight(upDetails)) {
      widget.baseRightCallback();
    }
    if (_itIsHome(upDetails)) {
      togglePaw();
    }
  }

  @override
  void dispose() {
    _pawController.dispose();
    super.dispose();
  }
}
