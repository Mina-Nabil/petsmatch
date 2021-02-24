import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/theme/petsTheme.dart';

class PetMatchSingleScreen extends StatefulWidget {
  PetMatchSingleScreen({
    @required this.body,
    this.backgroundMask,
    this.title,
    this.enableRotation = false,
    this.backArrow = true,
  });

  final Widget body;
  final Widget title;
  final bool backArrow;
  final bool enableRotation;
  final bgMask backgroundMask;

  @override
  _PetMatchSingleScreenState createState() => _PetMatchSingleScreenState();
}

class _PetMatchSingleScreenState extends State<PetMatchSingleScreen> {
  String bgMaskPath;
  Image bgMaskImage;

  @override
  void initState() {
    super.initState();

    switch (this.widget.backgroundMask) {
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
      default:
        bgMaskPath = "assets/images/masks/def_blue.png";
        break;
    }
    print(bgMaskPath);
    bgMaskImage = Image.asset(
      bgMaskPath,
      fit: BoxFit.cover,
      color: PetsTheme.currentBgMainColor.withOpacity(1.0),
      colorBlendMode: BlendMode.srcOut,
    );

    if (widget.enableRotation)
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
  Widget build(BuildContext context) {
    print(kToolbarHeight);
    return Stack(
      children: [
        //Background Image
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: PetsTheme.currentBgMainColor,
          child: bgMaskImage,
        ),

        SafeArea(
          top: true,
          bottom: false,
          right: true,
          left: true,
          child: CupertinoPageScaffold(
            backgroundColor: Colors.transparent,
            child: Stack(
              children:[
                 Container(
                   margin: (widget.backArrow || widget.title != null) ? EdgeInsets.only(top:56) : EdgeInsets.zero,
                   child: SafeArea(child: widget.body)),
                if(widget.backArrow || widget.title != null)
                Container(
                  width: double.infinity,
                  height: 56,
                  child: Stack(
                    children: [

                      if(widget.title != null)
                        Center(
                          child: widget.title,
                        ),

                      if(widget.backArrow)
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.white,)
                          ),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                    ],
                  )
                ),]
            ),
        )
    )
      ]);
  }
}
