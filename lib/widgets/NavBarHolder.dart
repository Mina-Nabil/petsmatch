import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/NavBar.dart';

class NavBarHolder extends StatefulWidget {
  @override
  _NavBarHolderState createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder> with SingleTickerProviderStateMixin {
  //original scale
  static final double navBarHeight = .355;
  static final double navBarMargin = .01;

  static final double navBarInnerHeight = .23716;
  static final double navBarInnerHeightPos = 1 - .23716;
  static final double navBarContainerHeight = navBarInnerHeight * navBarHeight;
  static final double navBarButtonPadding = .01;

  static final double pawBegin = 0;
  static final double pawEnd = 1;

  bool expanded = false;

  ///animations
  Animation<double> _pawScale;

  AnimationController _pawController;

  @override
  void initState() {
    super.initState();
    _pawController = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _pawScale = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _pawController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pawScale,
      builder: (context, child) {
        return GestureDetector(
          onTapUp: navTapHandle,
          child: Container(
            height: MediaQuery.of(context).size.height * navBarHeight,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * navBarMargin),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CustomPaint(
                  painter: NavBar(_pawScale.value, navBarInnerHeightPos, expanded),
                  child: Container(),
                ),
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
          ),
        );
      },
    );
  }

  Widget getNavButtonContainer(imgPath, opacity) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: EdgeInsets.all(navBarButtonPadding * MediaQuery.of(context).size.height),
        margin: EdgeInsets.only(bottom: navBarButtonPadding / 2 * MediaQuery.of(context).size.height),
        height: navBarContainerHeight * MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Image.asset(
          imgPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget getNavButtonIconContainer(IconData icon, opacity, {bool isPage=false}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: EdgeInsets.all(navBarButtonPadding * MediaQuery.of(context).size.height),
        margin: EdgeInsets.only(bottom: navBarButtonPadding / 2 * MediaQuery.of(context).size.height),
        height: navBarContainerHeight * MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: FittedBox(
            child: Padding(
                padding: EdgeInsets.all(PetsTheme.getMuchLargerPadMarg(context)),
                child: FaIcon(
                  icon,
                  color: (isPage) ? PetsTheme.cyan : PetsTheme.cyan.withOpacity(.4),
                  size: 100,
                ))),
      ),
    );
  }

  bool _itIsHome(TapUpDetails upDetails) {
    double firstLimit = MediaQuery.of(context).size.width * .4;
    double endLimit = MediaQuery.of(context).size.width * .6;
    return (upDetails.localPosition.dx > firstLimit && upDetails.localPosition.dx < endLimit);
  }

  void shrinkPaw() {
    _pawController.reverse();
    setState(() {
      print(_pawScale.value);
      expanded = false;
    });
  }

  void expandPaw() {
    _pawController.forward();
    setState(() {
      expanded = true;
    });
  }

  void togglePaw() {
    if (expanded)
      shrinkPaw();
    else
      expandPaw();
  }

  void navTapHandle(TapUpDetails upDetails) {
    if (_itIsHome(upDetails)) {
      print("msh batogle ?!");
      togglePaw();
    }
  }

  @override
  void dispose() {
    _pawController.dispose();
    super.dispose();
  }
}
