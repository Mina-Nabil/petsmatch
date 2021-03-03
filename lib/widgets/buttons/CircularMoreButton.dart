import 'package:flutter/material.dart';


class CircularMoreButton extends StatelessWidget {

  CircularMoreButton(
    {
      this.radius = 12,
      @required this.color,
      @required this.backgroundColor,
      @required this.onPressed,
    }
  );
  final double radius;
  final Color color;
  final Color backgroundColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: radius*2,
          width: radius*2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.backgroundColor,
          ),
          child: Icon(Icons.more_horiz_rounded, color: color,),
      ),
      onTap: onPressed,
    );
  }
}