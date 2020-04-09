import '../../theme/petsTheme.dart';
import '../basescreen.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
      if(true){ //replace with authentication result
        Navigator.pushReplacement(context, new PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
          child: LoginScreen()
        ));
      } else {
        //Navigate to home screen when done
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Padding & Marging Init
    final double smallPadMarg = (MediaQuery.of(context).size.width > PetsTheme.bigScreenWidth) ? 8 :(MediaQuery.of(context).size.width > PetsTheme.smallScreenWidth) ? 5 : 3 ;
    final double muchLargerPadMarg = 3.5 * smallPadMarg ;
    return BaseScreen(
      isTopPadding: true,
      noTitle: true,
      backGroundColor: Colors.white,
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
                          alignment: Alignment.bottomCenter,
                            child: Image.asset("assets/images/logo.png"))),

                    Flexible(
                      fit: FlexFit.loose,
                      flex: 6,
                      child: Container( 
                        alignment: Alignment.topCenter,
                        child: Text("PetMatch", 
                        style: TextStyle( 
                          fontFamily: "Oregano",
                          fontSize: PetsTheme.getVeryLargeFont(context)
                        ),),
                      ),
                    )
                  ],
                )),
          ),
        );
  }
}
