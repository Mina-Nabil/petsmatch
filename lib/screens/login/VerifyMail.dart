import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/login/CongratsScreen.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/LoginScreenSetup.dart';
import 'package:petmatch/widgets/PetsButton.dart';

class VerifyMailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mail = "mina9492@hotmail.com";

    Widget formWidget = Column(
      children: [
        Flexible(flex: 3, child: SvgPicture.asset(Paths.verfMail_icon_file)),
        Flexible(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "check your email and verify your account to continue",
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: PetsTheme.getSmallFont(context), fontFamily: "Roboto", color: PetsTheme.petsTextGrayColor.withAlpha(255)),
              ),
            )),
        Flexible(
          flex: 1,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: SizedBox(
              child: Text("Resend?"),
            ),
          ),
        ),
        PetsButton(
            callBackFunction: () => Navigator.of(context).pushReplacement(new PageTransition(child: CongratsScreen(), type: PageTransitionType.upToDown, duration: Duration(milliseconds: 800))),
            buttonText: "Done",
            isBorder: false,
            bgColor: PetsTheme.petsBlueColor,
            textColor: Colors.white),
        Flexible(child: Container(), flex: 2)
      ],
    );

    return LoginScreenSetup(
      formTitle: "Passcode sent to " + mail,
      smalFormTitle: true,
      formTitleTextAlignment: TextAlign.center,
      showLogo: false,
      topbarTitle: "One last step",
      topbarSubtitle: "Verify the email",
      isSmallTopArea: true,
      isBottomScrollable: false,
      formWidget: formWidget,
    );
  }
}
