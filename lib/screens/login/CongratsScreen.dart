import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/PetsButton.dart';

class CongratsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 2,
                child: FittedBox(
                  child: Column(
                    children: [
                      Container(
                        child: Text("Congratulations",
                            style: TextStyle(
                              color: PetsTheme.currentMainColor,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: PetsTheme.getVeryLargeFont(),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                        child: Text("Your account has been created",
                            style: TextStyle(
                              color: PetsTheme.petsTextGrayColor,
                              fontFamily: "Roboto",
                              fontSize: PetsTheme.getLargerFont(),
                            )),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset('assets/images/custom/congrats.png', fit: BoxFit.contain),
                )),
            PetsButton(
              buttonText: "Done",
              callBackFunction: () => Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false),
              bgColor: PetsTheme.currentMainColor,
              textColor: Colors.white,
              isBorder: false,
            )
          ],
        ),
      ),
    );
  }
}
