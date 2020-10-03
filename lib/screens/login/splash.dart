import '../../theme/petsTheme.dart';
import '../basescreen.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    _visible = false;
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        _visible = true;
      });
    });
    Future.delayed(Duration(milliseconds: 3000)).then((_) {
      print("LOGGING IN NOW"); //function el login hna
      if (true) {
        //replace with authentication result
    
        Navigator.pushReplacement(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 1200), child: LoginScreen()));
      } else {
        //Navigate to home screen when done
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Padding & Marging Init
    return BaseScreen(
      isTopPadding: true,
      noTitle: true,
      child: Container(
        child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 2000),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                    fit: FlexFit.loose,
                    flex: 6,
                    child: Container(
                        alignment: Alignment.center,
                        child: Hero(
                            tag: "logo",
                            child: SvgPicture.asset(
                              "assets/images/logo/orig.svg",
                              color: PetsTheme.whiteBarColor,
                            )))),
              ],
            )),
      ),
    );
  }
}
