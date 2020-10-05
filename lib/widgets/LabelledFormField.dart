import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';

class LabelledFormField extends StatelessWidget {
  const LabelledFormField({@required this.label, @required this.fieldHeight, @required this.childField, this.widthRatio = 0.7});

  final double fieldHeight;
  final double widthRatio;
  final Widget childField;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: fieldHeight,
        width: MediaQuery.of(context).size.width * widthRatio,
        constraints: BoxConstraints(maxHeight: fieldHeight),
        margin: EdgeInsets.symmetric(vertical: PetsTheme.getLargePadMarg(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                flex: 1,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                        child: Text(
                      label,
                      style: TextStyle(color: PetsTheme.petsGrayColor),
                    )))),
            Flexible(flex: 3, child: childField)
          ],
        ));
  }
}
