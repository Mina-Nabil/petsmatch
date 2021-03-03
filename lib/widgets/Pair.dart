import 'package:flutter/material.dart';


class Pair extends StatelessWidget {

  Pair(this.first,this.second, {this.direction = Axis.vertical});

  final Widget first;
  final Widget second;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case Axis.horizontal:
        return Row(
          children: [first, second],
        );
      case Axis.vertical:
        return Column(
          children: [first, second],
        );
      default:
      assert(false);
    }

  }
}