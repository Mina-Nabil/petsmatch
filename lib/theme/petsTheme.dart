import 'package:flutter/material.dart';

class PetsTheme {
  //Big Screen Size -- for font customization
  static const double bigScreenWidth = 400;
  static const double smallScreenWidth = 320;
  static const double bigScreenHeight = 800;
  static const double smallScreenHeight = 600;

  //Colors

  static const Color petsBlueColor = Color.fromRGBO(61, 107, 255, 1);
  static const Color petsPurpleColor = Color.fromRGBO(47, 8, 151, 1);
  static const Color petsPinkColor = Color.fromRGBO(114, 9, 183, 1);
  static const Color petsCyanColor = Color.fromRGBO(31, 175, 219, 1);
  static const Color petsTextGrayColor = Color.fromARGB(128, 69, 79, 99);
  static const Color petsBordersGrayColor = Color.fromRGBO(112, 112, 112, 0.5);
  static const Color petsHintGrayColor = Color.fromRGBO(69, 79, 99, 0.5);
  static const Color petsGreenColor = Color.fromRGBO(6, 214, 160, 1);
  static Color currentMainColor = petsBlueColor;

  static final Color petsBgBlueColor = petsBlueColor.withOpacity(.6);
  static final Color petsBgPurpleColor = petsPurpleColor.withOpacity(.6);
  static final Color petsBgPinkColor = petsPinkColor.withOpacity(.6);
  static final Color petsBgCyanColor = petsCyanColor.withOpacity(.6);
  static const Color whiteBarColor = Color.fromRGBO(249, 250, 255, 1);

  static const Color blackTextColor = Color.fromRGBO(69, 79, 99, 1);

// old design color
  @deprecated
  static final Color pawColor = Color.fromRGBO(61, 107, 255, 1);
  @deprecated
  static final Color bgColor = Color.fromRGBO(126, 229, 255, 1);
  @deprecated
  static final Color cyan = Color.fromRGBO(180, 240, 255, 1);
  @deprecated
  static final Color darkBgColor = Color.fromRGBO(42, 46, 67, 1);
  @deprecated
  static final Color fieldsBackGroundColor = Color.fromRGBO(204, 245, 255, .6);
  @deprecated
  static final Color hintColor = Color.fromRGBO(121, 132, 142, .52);
  @deprecated
  static final Color fbBlue = Color.fromRGBO(60, 102, 196, 1);
  @deprecated
  static final Color googleRed = Color.fromRGBO(207, 67, 50, 1);

  //Font init .. use initFont before use
  static double _veryLargeFont;
  static double _listTitleFont;
  static double _muchLargerFont;
  static double _evenMuchLargerFont;
  static double _largerFont;
  static double _largeFont;
  static double _meduimFont;
  static double _smallFont;

  //Icons Size
  static double _smallIconSize;

  //Padding & Marging .. use initFonts before use
  static double _smallPadMarg;
  static double _smallerPadMarg;
  static double _moreSmallPadMarg;
  static double _smallestPadMarg;

  static double _meduimPadMarg;
  static double _largePadMarg;
  static double _largerPadMarg;
  static double _muchLargerPadMarg;
  static double _largestPadMarg;

  static void _initFonts(BuildContext context) {
    //Font init
    _smallIconSize = (MediaQuery.of(context).size.width > bigScreenWidth) ? 50 : 40;

    _veryLargeFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 50 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 44 : 35;
    _evenMuchLargerFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 32 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 27 : 24;
    _muchLargerFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 26 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 24 : 22;
    _largerFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 24 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 21 : 18;
    _largeFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 20 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 18 : 17;
    _meduimFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 16 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 14 : 12;
    _smallFont = (MediaQuery.of(context).size.width > bigScreenWidth) ? 13 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 13 : 10;

    //Padding & Marging Init
    _smallPadMarg = (MediaQuery.of(context).size.width > bigScreenWidth) ? 7 : (MediaQuery.of(context).size.width > smallScreenWidth) ? 5 : 3;
    _smallerPadMarg = 0.75 * _smallPadMarg;
    _moreSmallPadMarg = 0.5 * _smallPadMarg;
    _smallestPadMarg = 0.25 * _smallPadMarg;
    _meduimPadMarg = 1.5 * _smallPadMarg;
    _largePadMarg = 2 * _smallPadMarg;
    _largerPadMarg = 2.5 * _smallPadMarg;
    _muchLargerPadMarg = 3.5 * _smallPadMarg;
    _largestPadMarg = 5 * _smallPadMarg;
  }

  static double getVeryLargeFont(BuildContext context) {
    if (_veryLargeFont == null) _initFonts(context);
    return _veryLargeFont;
  }

  static double getEvenMuchLargerFont(BuildContext context) {
    if (_evenMuchLargerFont == null) _initFonts(context);
    return _evenMuchLargerFont;
  }

  static double getMuchLargerFont(BuildContext context) {
    if (_muchLargerFont == null) _initFonts(context);
    return _muchLargerFont;
  }

  static double getLargerFont(BuildContext context) {
    if (_largerFont == null) _initFonts(context);
    return _largerFont;
  }

  static double getLargeFont(BuildContext context) {
    if (_largeFont == null) _initFonts(context);
    return _largeFont;
  }

  static double getMeduimFont(BuildContext context) {
    if (_meduimFont == null) _initFonts(context);
    return _meduimFont;
  }

  static double getSmallFont(BuildContext context) {
    if (_smallFont == null) _initFonts(context);
    return _smallFont;
  }

  static double getSmallIconSize(BuildContext context) {
    if (_smallIconSize == null) _initFonts(context);
    return _smallIconSize;
  }

  static double getSmallerPadMarg(BuildContext context) {
    if (_smallerPadMarg == null) _initFonts(context);
    return _smallerPadMarg;
  }

  static double getMoreSmallerPadMarg(BuildContext context) {
    if (_moreSmallPadMarg == null) _initFonts(context);
    return _smallerPadMarg;
  }

  static double getSmallestPadMarg(BuildContext context) {
    if (_smallestPadMarg == null) _initFonts(context);
    return _smallestPadMarg;
  }

  static double getSmallPadMarg(BuildContext context) {
    if (_smallPadMarg == null) _initFonts(context);
    return _smallPadMarg;
  }

  static double getMeduimPadMarg(BuildContext context) {
    if (_meduimPadMarg == null) _initFonts(context);
    return _meduimPadMarg;
  }

  static double getLargePadMarg(BuildContext context) {
    if (_largePadMarg == null) _initFonts(context);
    return _largePadMarg;
  }

  static double getLargerPadMarg(BuildContext context) {
    if (_largerPadMarg == null) _initFonts(context);
    return _largerPadMarg;
  }

  static double getMuchLargerPadMarg(BuildContext context) {
    if (_muchLargerPadMarg == null) _initFonts(context);
    return _muchLargerPadMarg;
  }

  static double getLargestPadMarg(BuildContext context) {
    if (_largestPadMarg == null) _initFonts(context);
    return _largestPadMarg;
  }
}
