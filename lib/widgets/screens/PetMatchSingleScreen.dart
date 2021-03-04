import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petmatch/theme/petsTheme.dart';

class PetMatchSingleScreen extends StatefulWidget {
  PetMatchSingleScreen({
    this.title,
    this.header,
    this.body,
    this.bodyBackgroundColor,
    this.backgroundMask,
    this.scrollableHeader = false,
    this.enableRotation = false,
    this.backArrow = false,
  }) : 
  /*
  Can not have title widget (appBar widget) and scrollable header
  */
  assert( ! (title != null && scrollableHeader));


  final Widget title;  // AppBar widget
  final Widget header; // Upper Widget with mask background
  final Widget body;   // Main widget(s) for the screen

  final Color bodyBackgroundColor;
  final bool backArrow;
  final bool scrollableHeader;
  final bool enableRotation;
  final bgMask backgroundMask;

  @override
  _PetMatchSingleScreenState createState() => _PetMatchSingleScreenState();
}

class _PetMatchSingleScreenState extends State<PetMatchSingleScreen> {
  String bgMaskPath;
  DecorationImage  backgroundImage;

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

    backgroundImage = DecorationImage(
      image: Image.asset(bgMaskPath).image,
      fit: BoxFit.cover, 
      colorFilter: ColorFilter.mode(
      PetsTheme.currentBgMainColor.withOpacity(1.0) , BlendMode.srcOut),
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
    return SafeArea(
      top: false,
      bottom: false,
      right: true,
      left: true,
      child: CupertinoPageScaffold(
        backgroundColor: widget.bodyBackgroundColor?? Colors.grey[100],
        child: Material(
          color: Colors.transparent, 
          child:  Stack(
            children:[
              Container(
                child: SafeArea(
                  top: false, bottom: false, right: true, left: true, 
                  child: _buildScreenWidget()
                )
              ),
              
              if(widget.backArrow || widget.title != null)
                PetMatchAppBar(title: widget.title, backArrow: widget.backArrow,),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildScreenWidget() {
    if(widget.scrollableHeader) {
      return SingleChildScrollView(
        child: Column(
          children:[
            _buildHeaderWidget(),
            _buildBodyWidget(),
          ]
        ),
      );
    } else {
      return Column(
        children:[
          _buildHeaderWidget(),
          Expanded(child: _buildBodyWidget(),),
        ]
      );
    }
  }

  Widget _buildHeaderWidget() {
    bool appBarExists = (widget.backArrow || widget.title != null);
    
    return Container(
      padding:  appBarExists ? EdgeInsets.only(top:(56 + MediaQuery.of(context).padding.top)) : EdgeInsets.only(top:MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color:  Colors.black.withOpacity(0.7),
        image: backgroundImage,
      ),
      child: widget.header,
    );
  }

  Widget _buildBodyWidget() {
    return Container(
      decoration: BoxDecoration(
          color:  PetsTheme.currentBgMainColor.withOpacity(1),
        ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        child: Container(
          width: double.infinity,
          color: widget.bodyBackgroundColor?? Colors.grey[100],
          child: widget.body
          )
      ),
    );
  } 
}

class PetMatchAppBar extends StatelessWidget {

  PetMatchAppBar({
    this.title,
    this.backArrow = false,
  });

  final Widget title;
  final bool backArrow;
  final double appBarLeftPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:MediaQuery.of(context).padding.top),
      color: Colors.transparent,
      width: double.infinity,
        height: 56 + MediaQuery.of(context).padding.top,
        child: Stack(
          children: [
            if(title != null)
              Container(
                padding:  EdgeInsets.only(left: backArrow? appBarLeftPadding*2.5 : appBarLeftPadding),
                alignment: Alignment.centerLeft,
                child: title,
              ),
            
            if(backArrow)
              GestureDetector(
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(left: appBarLeftPadding),
                  alignment: Alignment.centerLeft,
                  child: FaIcon(FontAwesomeIcons.chevronLeft, color: Colors.white,)
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
          ],
        )
    );
  }
}
