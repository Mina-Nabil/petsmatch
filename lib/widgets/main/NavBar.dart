import 'package:flutter/material.dart';
import '../../theme/petsTheme.dart';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart' show decodeImageFromList;

import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class NavBar extends CustomPainter {
  static final Paint _barPainter = new Paint()
    ..color = PetsTheme.whiteBarColor
    ..style = PaintingStyle.fill;

  static final Paint _barStroker = new Paint()
    ..color = PetsTheme.petsGrayIconColor
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  Paint _pawPainter = new Paint()
    ..color = PetsTheme.currentMainColor
    ..style = PaintingStyle.fill;

  Paint _imagesPainter = new Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  double scale;
  bool expanded;
  double _barHeight;

  final ui.Image serviceImage;
  final ui.Image trainingImage;
  final ui.Image walkingImage;
  final ui.Image matingImage;

  NavBar(this.scale, this._barHeight, this.expanded, this.serviceImage, this.trainingImage, this.walkingImage, this.matingImage);

  @override
  void paint(Canvas canvas, Size size) async {
    ////Shar7 el interpolation
    // final double startRange = 0;
    // final double endRange = 1;

    // final double range = endRange - startRange; //kda kda
    // final double shiftScale = (scale - startRange) / range;
    // final double _bar1WidthStart = .42;
    // final double _bar1WidthEnd = .44;
    // final double _barHeight = (shiftScale * (_bar1WidthEnd - _bar1WidthStart)) + _bar1WidthStart;

    ///bar dimensions

    //first bar rect width
    final double _bar1WidthStart = .405;
    final double _bar1WidthEnd = .322;
    final double _bar1Width = (scale * (_bar1WidthEnd - _bar1WidthStart)) + _bar1WidthStart; //Animated top bar width

    // final double _arc1XStart = .4675;
    // final double _arc1XEnd = .43;
    // final double _arc1X = (scale * (_arc1XEnd - _arc1XStart) + _arc1XStart);

    // final double _arc1YStart = .87295;
    // final double _arc1YEnd = .932;
    // final double _arc1Y = (scale * (_arc1YEnd - _arc1YStart) + _arc1YStart);

    // final double _arc1RadiusXStart = 0.00137333333;
    // final double _arc1RadiusXEnd = 0.0014333333;
    // final double _arc1RadiusX = (scale * (_arc1RadiusXEnd - _arc1RadiusXStart) + _arc1RadiusXStart);

    // final double _arc1RadiusYStart = 0.00213333333;
    // final double _arc1RadiusYEnd = 0.00213333333;
    // final double _arc1RadiusY = (scale * (_arc1RadiusYEnd - _arc1RadiusYStart) + _arc1RadiusYStart);

    final double _quadCenterX = .5; //No need for animation =)

    // final double _quadCemterYStart = .85;
    // final double _quadCenterYEnd = .87;
    // final double _quadCenterY = (scale * (_quadCenterYEnd - _quadCemterYStart) + _quadCemterYStart);

    // final double _arc2X = 1 - _arc1X; //TBA -- Derived
    // final double _arc2Y = _arc1Y; //TBA -- Derived
    // final double _arc3X = 1 - _bar1Width;
    // final double _arc3Y = _barHeight;

    ///paw dimensions
    final double minTopStart = .582;
    final double minTopEnd = minTopStart / 2;
    final double minTop = (scale * (minTopEnd - minTopStart) + minTopStart);

    final double _botPawYStart = .916;
    final double _botPawYEnd = .926;
    final double _botPawY = (scale * (_botPawYEnd - _botPawYStart) + _botPawYStart);

    final double _topPawYStart = .726;
    final double _topPawYEnd = .606;
    final double _topPawY = (scale * (_topPawYEnd - _topPawYStart) + _topPawYStart);

    final double _pawQuad1X1Start = .385;
    final double _pawQuad1X1End = .285;
    final double _pawQuad1X1 = (scale * (_pawQuad1X1End - _pawQuad1X1Start) + _pawQuad1X1Start);

    final double _pawQuad1Y1Start = .946;
    final double _pawQuad1Y1End = .996;
    final double _pawQuad1Y1 = (scale * (_pawQuad1Y1End - _pawQuad1Y1Start) + _pawQuad1Y1Start);

    final double _pawQuad1StartXStart = .451;
    final double _pawQuad1StartXEnd = .411;
    final double _pawQuad1StartX = (scale * (_pawQuad1StartXEnd - _pawQuad1StartXStart) + _pawQuad1StartXStart);

    final double _pawQuad1EndXStart = .4655;
    final double _pawQuad1EndXEnd = .44;
    final double _pawQuad1EndX = (scale * (_pawQuad1EndXEnd - _pawQuad1EndXStart) + _pawQuad1EndXStart);

    final double _pawCenterYStart = .868;
    final double _pawCenterYEnd = .828;
    final double _pawCenterY = (scale * (_pawCenterYEnd - _pawCenterYStart) + _pawCenterYStart);

    ///derived Paw dimensions
    final double _pawQuad2X1 = 1 - _pawQuad1X1; //TBA -- Derived
    final double _pawQuad2Y1 = _pawQuad1Y1; //TBA  -- Derived

    final double _pawQuad2StartX = 1 - _pawQuad1EndX;
    final double _pawQuad2EndX = 1 - _pawQuad1StartX;

    final double topHeight = _barHeight * size.height;
    final double actualBar1Width = _bar1Width * size.width;

    final double pawImageRatio = 0.65;

    Path bar = new Path()
      ..moveTo(0, topHeight)
      // ..lineTo(actualBar1Width, topHeight)
      // ..arcToPoint(new Offset(_arc1X * size.width, _arc1Y * size.height),
      //     radius: Radius.elliptical(_arc1RadiusX * size.width, _arc1RadiusY * size.height), clockwise: false)
      // ..quadraticBezierTo(_quadCenterX * size.width, _quadCenterY * size.height, _arc2X * size.width, _arc2Y * size.height)
      // ..arcToPoint(new Offset(_arc3X * size.width, _arc3Y * size.height),
      //     radius: Radius.elliptical(_arc1RadiusX * size.width, _arc1RadiusY * size.height), clockwise: false)
      ..lineTo(size.width, topHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, topHeight);
    canvas.drawPath(bar, _barPainter);
    canvas.drawLine(new Offset(0, topHeight), new Offset(size.width, topHeight), _barStroker);
    Path paw = new Path()
      ..moveTo(_pawQuad1StartX * size.width, _topPawY * size.height)
      ..quadraticBezierTo(_pawQuad1X1 * size.width, _pawQuad1Y1 * size.height, _pawQuad1EndX * size.width, _botPawY * size.height)
      ..quadraticBezierTo(_quadCenterX * size.width, _pawCenterY * size.height, _pawQuad2StartX * size.width, _botPawY * size.height)
      ..quadraticBezierTo(_pawQuad2X1 * size.width, _pawQuad2Y1 * size.height, _pawQuad2EndX * size.width, _topPawY * size.height)
      ..quadraticBezierTo(size.width / 2, minTop * size.height, _pawQuad1StartX * size.width, _topPawY * size.height);

    // canvas.drawShadow(paw.shift(new Offset(5, 0)), Colors.black, 2, false);
    if (scale > .3) {
      canvas.drawShadow(paw, Colors.black, 3.5, false);
    }
    canvas.drawPath(paw, _pawPainter);

    if (scale > .3) {
      //paw ovals dimensions
      final double paw2XCenterStart = .45;
      final double paw2XCenterEnd = .4185;
      final double paw2XCenter = ((scale * (paw2XCenterEnd - paw2XCenterStart) + paw2XCenterStart));
      final double paw3XCenter = 1 - paw2XCenter;

      final double paw1XCenterStart = 0.484;
      final double paw1XCenterEnd = 0.324;
      final double paw1XCenter = ((scale * (paw1XCenterEnd - paw1XCenterStart) + paw1XCenterStart));
      final double paw4XCenter = 1 - paw1XCenter;

      final double topPawCenterYStart = .30825;
      final double topPawCenterYEnd = 0.055;
      final double topPawCenterY = ((scale * (topPawCenterYEnd - topPawCenterYStart) + topPawCenterYStart)) / .355;

      final double botPawCenterYStart = .30832;
      final double botPawCenterYEnd = .17832;
      final double botPawCenterY = ((scale * (botPawCenterYEnd - botPawCenterYStart) + botPawCenterYStart)) / .355;

      final double topPawWidthStart = .03;
      final double topPawWidthEnd = .15;
      final double topPawWidth = scale * (topPawWidthEnd - topPawWidthStart) + topPawWidthStart;

      final double topPawHeightStart = 0.0364317841 / 2;
      final double topPawHeightEnd = 0.138;
      final double topPawHeight = (((scale * (topPawHeightEnd - topPawHeightStart) + topPawHeightStart)) / .355);

      final double botPawWidthStart = .03;
      final double botPawWidthEnd = .1413;
      final double botPawWidth = scale * (botPawWidthEnd - botPawWidthStart) + botPawWidthStart;

      final double botPawHeightStart = .05;
      final double botPawHeightEnd = .118;
      final double botPawHeight = (scale * (botPawHeightEnd - botPawHeightStart) + botPawHeightStart) / .355;

      Offset paw1Offset = Offset(paw1XCenter * size.width, botPawCenterY * size.height);
      Offset paw2Offset = Offset(paw2XCenter * size.width, topPawCenterY * size.height);
      Offset paw3Offset = Offset(paw3XCenter * size.width, topPawCenterY * size.height);
      Offset paw4Offset = Offset(paw4XCenter * size.width, botPawCenterY * size.height);
      Rect paw1 = Rect.fromCenter(center: paw1Offset, width: botPawWidth * size.width, height: botPawHeight * size.height);
      Rect paw2 = Rect.fromCenter(center: paw2Offset, width: topPawWidth * size.width, height: topPawHeight * size.height);
      Rect paw3 = Rect.fromCenter(center: paw3Offset, width: topPawWidth * size.width, height: topPawHeight * size.height);
      Rect paw4 = Rect.fromCenter(center: paw4Offset, width: botPawWidth * size.width, height: botPawHeight * size.height);
      Rect paw1Image = Rect.fromCenter(center: paw1Offset, width: botPawWidth * size.width * pawImageRatio, height: botPawHeight * size.height * pawImageRatio);
      Rect paw2Image = Rect.fromCenter(center: paw2Offset, width: topPawWidth * size.width * pawImageRatio, height: topPawHeight * size.height * pawImageRatio);
      Rect paw3Image = Rect.fromCenter(center: paw3Offset, width: topPawWidth * size.width * pawImageRatio, height: topPawHeight * size.height * pawImageRatio);
      Rect paw4Image = Rect.fromCenter(center: paw4Offset, width: botPawWidth * size.width * pawImageRatio, height: botPawHeight * size.height * pawImageRatio);

      // canvas.drawShadow((new Path()..addOval(paw2)).shift(new Offset(2, 0)), Colors.black.withOpacity((scale > .3 ? scale : 0)), 2, false);
      canvas.drawShadow(new Path()..addOval(paw2), Colors.black.withOpacity((scale > .3 ? scale : 0)), 3.5, false);
      canvas.drawOval(paw2, _pawPainter);

      // canvas.drawShadow((new Path()..addOval(paw3)).shift(new Offset(2, 0)), Colors.black.withOpacity((scale > .3 ? scale : 0)), 2, false);
      canvas.drawShadow(new Path()..addOval(paw3), Colors.black.withOpacity((scale > .5 ? scale : 0)), 3.5, false);
      canvas.drawOval(paw3, _pawPainter);

      // canvas.drawShadow((new Path()..addOval(paw1)).shift(new Offset(2, 0)), Colors.black.withOpacity((scale > .3 ? scale : 0)), 2, false);
      canvas.drawShadow(new Path()..addOval(paw1), Colors.black.withOpacity((scale > .3 ? scale : 0)), 3.5, false);
      canvas.drawOval(paw1, _pawPainter);

      // canvas.drawShadow((new Path()..addOval(paw4)).shift(new Offset(2, 0)), Colors.black.withOpacity((scale > .3 ? scale : 0)), 2, false);
      canvas.drawShadow(new Path()..addOval(paw4), Colors.black.withOpacity((scale > .3 ? scale : 0)), 3.5, false);
      canvas.drawOval(paw4, _pawPainter);

      canvas.drawImageNine(serviceImage, paw1, paw1Image, _imagesPainter..color = (scale > .3) ? Colors.white : Colors.transparent);
      canvas.drawImageNine(trainingImage, paw2, paw2Image, _imagesPainter);
      canvas.drawImageNine(matingImage, paw3, paw3Image, _imagesPainter);
      canvas.drawImageNine(walkingImage, paw4, paw4Image, _imagesPainter);
    }
  }

  @override
  bool shouldRepaint(NavBar oldDelegate) {
    return (oldDelegate.scale != scale || oldDelegate.expanded != expanded || oldDelegate._pawPainter.color != _pawPainter.color);
  }

  Future<ui.Image> loadImageAsset(String assetName) async {
    final data = await rootBundle.load(assetName);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}