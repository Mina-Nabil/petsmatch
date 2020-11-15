import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/NavBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarHolder extends StatefulWidget {
  //original scale
  static final double navBarHeight = .355;
  static final double navBarMargin = .01;

  static final double navBarInnerHeight = .23716;
  static final double navBarInnerHeightPos = 1 - .23716;
  static final double navBarContainerHeight = navBarInnerHeight * navBarHeight;
  static final double navBarButtonPadding = .01;

  static final double pawBegin = 0;
  static final double pawEnd = 1;

  //paw circles ratio
  static final double xStart = 0.4;
  static final double xEnd = 0.6;
  static final double xExpandedStart = 0.2;
  static final double xExpandedEnd = 0.8;
  static bool expanded = false;

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

  Future<ui.Image> loadSvgImage(String path,  {dimensions=120.0}) async {
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
          height: MediaQuery.of(context).size.height * NavBarHolder.navBarHeight,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: getNavButtonIconContainer(FontAwesomeIcons.solidUserCircle, _pawScale.value * -1 + 1, isPage: true),
                  ),
                  Flexible(
                    flex: 2,
                    child: getNavButtonIconContainer(FontAwesomeIcons.calendarCheck, _pawScale.value * -1 + 1),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: getNavButtonIconContainer(FontAwesomeIcons.shoppingBasket, _pawScale.value * -1 + 1),
                  ),
                  Flexible(
                    flex: 2,
                    child: getNavButtonIconContainer(FontAwesomeIcons.cog, _pawScale.value * -1 + 1),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget getNavButtonContainer(imgPath, opacity) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: EdgeInsets.all(NavBarHolder.navBarButtonPadding * MediaQuery.of(context).size.height),
        margin: EdgeInsets.only(bottom: NavBarHolder.navBarButtonPadding / 2 * MediaQuery.of(context).size.height),
        height: NavBarHolder.navBarContainerHeight * MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Image.asset(
          imgPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget getNavButtonIconContainer(IconData icon, opacity, {bool isPage = false}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: EdgeInsets.all(NavBarHolder.navBarButtonPadding * MediaQuery.of(context).size.height),
        margin: EdgeInsets.only(bottom: NavBarHolder.navBarButtonPadding / 2 * MediaQuery.of(context).size.height),
        height: NavBarHolder.navBarContainerHeight * MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: FittedBox(
            child: Padding(
                padding: EdgeInsets.all(PetsTheme.getMuchLargerPadMarg(context)),
                child: FaIcon(
                  icon,
                  color: (isPage) ? PetsTheme.currentMainColor : PetsTheme.petsHintGrayColor,
                  size: 100,
                ))),
      ),
    );
  }

  bool _itIsHome(TapUpDetails upDetails) {
    double firstLimit = MediaQuery.of(context).size.width * NavBarHolder.xStart;
    double endLimit = MediaQuery.of(context).size.width * NavBarHolder.xEnd;
    double expanedFirstLimit = MediaQuery.of(context).size.width * NavBarHolder.xExpandedStart;
    double expandedEndLimit = MediaQuery.of(context).size.width * NavBarHolder.xExpandedEnd;
    return ((upDetails.localPosition.dx > firstLimit && upDetails.localPosition.dx < endLimit && !NavBarHolder.expanded) ||
        (upDetails.localPosition.dx > expanedFirstLimit && upDetails.localPosition.dx < expandedEndLimit && NavBarHolder.expanded));
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
