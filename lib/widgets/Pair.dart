import 'package:flutter/material.dart';


class Pair extends StatelessWidget {

  Pair(this.first,this.second, {this.direction = Axis.vertical, this.space = 0.0});

  final Widget first;
  final Widget second;
  final Axis direction;
  final double space;

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case Axis.horizontal:
        return Row(
          children: [first, SizedBox(width: space,) ,second],
        );
      case Axis.vertical:
        return Column(
          children: [first, SizedBox(height: space,), second],
        );
      default:
        return Column(
            children: [first, SizedBox(height: space,), second],
        );
    }

  }
}