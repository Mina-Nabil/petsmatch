import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircularPetButton extends StatelessWidget {
  final Color _bgColor;
  final String _iconPath;
  final Color _iconColor;

  CircularPetButton(this._bgColor, this._iconPath, this._iconColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _bgColor,
      ),
      child: Container(
        child: FractionallySizedBox(
          heightFactor: 0.65,
          widthFactor: 0.65,
          child: SvgPicture.asset(
            this._iconPath,
            color: this._iconColor,
          ),
        ),
      ),
    );
  }
}
