import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';

class NewPostWidget extends StatelessWidget {
  final double maxHeightRatio = .2;
  final double minHeightRatio = .12;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height * minHeightRatio, maxHeight: MediaQuery.of(context).size.height * maxHeightRatio),
        padding: EdgeInsets.symmetric(horizontal: PetsTheme.getLargerPadMarg(context), vertical: PetsTheme.getMeduimPadMarg(context)),
        child: Row()
        
        );
  }
}
