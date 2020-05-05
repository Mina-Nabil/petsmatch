import 'package:flutter/material.dart';
import 'package:petmatch/widgets/NavBar.dart';

class NavBarHolder extends StatefulWidget {
  @override
  _NavBarHolderState createState() => _NavBarHolderState();
}

class _NavBarHolderState extends State<NavBarHolder>
    with SingleTickerProviderStateMixin {
  //original scale
  static final double navBarHeight = .355;
  static final double navBarMargin = .01;

  static final double pawBegin = 0;
  static final double pawEnd = 1;

  bool expanded = false;

  ///animations
  Animation<double> _pawScale;

  AnimationController _pawController;

  @override
  void initState() {
    super.initState();
    _pawController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _pawScale = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _pawController, curve: Curves.linear));

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pawScale,
      builder: (context, child) {
        return GestureDetector(
          onTapUp: navTapHandle,
          child: Container(
            child: CustomPaint(
              painter: NavBar(_pawScale.value, expanded),
              child: Container(
                height: MediaQuery.of(context).size.height * navBarHeight,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * navBarMargin),
                color: Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }

  bool _itIsHome(TapUpDetails upDetails) {
    double firstLimit = MediaQuery.of(context).size.width * .4;
    double endLimit = MediaQuery.of(context).size.width * .6;
    return (upDetails.localPosition.dx > firstLimit &&
        upDetails.localPosition.dx < endLimit);
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
