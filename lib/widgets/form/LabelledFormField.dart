import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';

class LabelledFormField extends StatelessWidget {
  const LabelledFormField({@required this.label, @required this.fieldHeight, @required this.childField, @required this.width });

  final double fieldHeight;
  final double width;
  final Widget childField;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: fieldHeight,
        width: width,
        constraints: BoxConstraints(maxHeight: fieldHeight),
        margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg()),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                    width: width,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                        child: Text(
                      label,
                      style: TextStyle(color: PetsTheme.petsTextGrayColor),
                    )))),
            Flexible(flex: 3, child: childField)
          ],
        ));
  }
}
