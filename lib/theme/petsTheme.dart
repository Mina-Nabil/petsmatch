import 'package:flutter/material.dart';

//Declaring background mask and colors enums
enum bgColor { blue, purple, cyan, pink, main }
enum bgMask { def, mating, training, walk, services }

class PetsTheme {
  static PetsTheme _theme;

  //Big Screen Size -- for font customization
  static const double bigScreenWidth = 400;
  static const double smallScreenWidth = 320;
  static const double bigScreenHeight = 800;
  static const double smallScreenHeight = 600;

  static BuildContext _context;

  PetsTheme._(_context);

  static void initTheme(BuildContext context) {
    _context = context;
    _initFonts(_context);
  }

  static PetsTheme getTheme() {
    if (_context == null)
      return null;
    else
      return _theme;
  }

  //Colors

  static const Color petsBlueColor = Color.fromRGBO(61, 107, 255, 1);
  static const Color petsPurpleColor = Color.fromRGBO(47, 8, 151, 1);
  static const Color petsPinkColor = Color.fromRGBO(114, 9, 183, 1);
  static const Color petsCyanColor = Color.fromRGBO(31, 175, 219, 1);
  static const Color petsTextGrayColor = Color.fromARGB(128, 69, 79, 99);
  static const Color petsBordersGrayColor = Color.fromRGBO(112, 112, 112, 0.5);
  static const Color petsHintGrayColor = Color.fromRGBO(69, 79, 99, 0.5);
  static const Color petsGreenColor = Color.fromRGBO(6, 214, 160, 1);
  static const Color petsGrayIconColor = Color.fromARGB(51, 15, 19, 39);
  static final Color petsRedColor = Color.fromARGB(255, 255,0,110);
  static Color _currentMainColor = petsBlueColor;

  static final Color petsBgBlueColor = petsBlueColor.withOpacity(.6);
  static final Color petsBgPurpleColor = petsPurpleColor.withOpacity(.6);
  static final Color petsBgPinkColor = petsPinkColor.withOpacity(.6);
  static final Color petsBgCyanColor = petsCyanColor.withOpacity(.6);
  static final Color petsWhiteBg = Color.fromARGB(255, 246, 246, 246);
  static final Color petsRedBg = Color.fromARGB(25, 255,0,110);
  static final Color petsGreenBg = Color.fromARGB(25, 6,214,160);
  static final Color petsBlueBg = Color.fromARGB(25, 61,107,255);

  static const Color whiteBarColor = Color.fromRGBO(249, 250, 255, 1);
  static Color _currentBgMainColor = petsBlueColor;

  static const Color blackTextColor = Color.fromRGBO(69, 79, 99, 1);

  static Color commentBgColor = petsBlueColor.withOpacity(.1);

// old design color
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
  static double _verySmallFont;

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

  //Navbar ratio
  static double _navbarHeightRatio;
  static double _navbarInnerHeightRatio;

  static void _initFonts(BuildContext context) {
    //Font init
    _smallIconSize = (MediaQuery.of(context).size.width > bigScreenWidth) ? 25 : 15;

    _veryLargeFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 50
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 44
            : 35;
    _evenMuchLargerFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 32
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 27
            : 24;
    _muchLargerFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 26
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 24
            : 22;
    _largerFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 24
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 21
            : 18;
    _largeFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 20
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 18
            : 17;
    _meduimFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 16
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 14
            : 12;
    _smallFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 13
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 13
            : 10;
    _verySmallFont = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 12
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 10
            : 8;

    _navbarHeightRatio = (MediaQuery.of(context).size.height > bigScreenHeight)
        ? .20
        : (MediaQuery.of(context).size.height > smallScreenHeight)
            ? .22
            : .25;
    
    _navbarInnerHeightRatio = 0.3;

    //Padding & Marging Init
    _smallPadMarg = (MediaQuery.of(context).size.width > bigScreenWidth)
        ? 7
        : (MediaQuery.of(context).size.width > smallScreenWidth)
            ? 5
            : 3;
    _smallerPadMarg = 0.75 * _smallPadMarg;
    _moreSmallPadMarg = 0.5 * _smallPadMarg;
    _smallestPadMarg = 0.25 * _smallPadMarg;
    _meduimPadMarg = 1.5 * _smallPadMarg;
    _largePadMarg = 2 * _smallPadMarg;
    _largerPadMarg = 2.5 * _smallPadMarg;
    _muchLargerPadMarg = 3.5 * _smallPadMarg;
    _largestPadMarg = 5 * _smallPadMarg;
  }

  static double getVeryLargeFont() {
    assert(_context != null);
    return _veryLargeFont;
  }

  static double getEvenMuchLargerFont() {
    assert(_context != null);
    return _evenMuchLargerFont;
  }

  static double getMuchLargerFont() {
    assert(_context != null);
    return _muchLargerFont;
  }

  static double getLargerFont() {
    assert(_context != null);
    return _largerFont;
  }

  static double getLargeFont() {
    assert(_context != null);
    return _largeFont;
  }

  static double getMeduimFont() {
    assert(_context != null);
    return _meduimFont;
  }

  static double getSmallFont() {
    assert(_context != null);
    return _smallFont;
  }

  static double getVerySmallFont() {
    assert(_context != null);
    return _verySmallFont;
  }

  static double smallIconSize() {
    assert(_context != null);
    return _smallIconSize;
  }

  static double getSmallerPadMarg() {
    assert(_context != null);
    return _smallerPadMarg;
  }

  static double getMoreSmallerPadMarg() {
    assert(_context != null);
    return _smallerPadMarg;
  }

  static double getSmallestPadMarg() {
    assert(_context != null);
    return _smallestPadMarg;
  }

  static double getSmallPadMarg() {
    assert(_context != null);
    return _smallPadMarg;
  }

  static double getMeduimPadMarg() {
    assert(_context != null);
    return _meduimPadMarg;
  }

  static double getLargePadMarg() {
    assert(_context != null);
    return _largePadMarg;
  }

  static double getLargerPadMarg() {
    assert(_context != null);
    return _largerPadMarg;
  }

  static double getMuchLargerPadMarg() {
    assert(_context != null);
    return _muchLargerPadMarg;
  }

  static double getLargestPadMarg() {
    assert(_context != null);
    return _largestPadMarg;
  }

  static double getNavBarHeight() {
    assert(_context != null);
    return _navbarHeightRatio;
  }

  static double getNavBarInnerHeight() {
    assert(_context != null);
    return _navbarInnerHeightRatio;
  }

  static get currentMainColor {
    return _currentMainColor;
  }

  static Color get currentBgMainColor {
    return _currentBgMainColor;
  }

  static set currentMainColor(bgColor color) {
    switch (color) {
      case bgColor.blue:
        _currentMainColor = PetsTheme.petsBlueColor;
        _currentBgMainColor = PetsTheme.petsBgBlueColor;
        break;
      case bgColor.purple:
        _currentMainColor = PetsTheme.petsPurpleColor;
        _currentBgMainColor = PetsTheme.petsBgPurpleColor;
        break;
      case bgColor.pink:
        _currentMainColor = PetsTheme.petsPinkColor;
        _currentBgMainColor = PetsTheme.petsBgPinkColor;
        break;
      case bgColor.cyan:
        _currentMainColor = PetsTheme.petsCyanColor;
        _currentBgMainColor = PetsTheme.petsBgCyanColor;
        break;
      case bgColor.main: //current main background

        break;
      default: //no change in main

        break;
    }
  }
}
