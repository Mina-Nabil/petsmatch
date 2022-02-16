import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';

class PetsButton extends StatelessWidget {
  PetsButton({
    Key key,
    @required this.callBackFunction,
    @required this.buttonText,
    @required this.isBorder,
    this.isFullWidth = false,
    this.trailingWidget,
    this.fieldsWidth,
    this.bgColor = Colors.transparent,
    this.textColor = PetsTheme.petsBlueColor,
  }) : super(key: key);

  double fieldsWidth;
  final Function callBackFunction;
  final String buttonText;
  final Widget trailingWidget;
  final Color bgColor;
  final Color textColor;
  final bool isBorder;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    if (fieldsWidth == null) {
      fieldsWidth = MediaQuery.of(context).size.width * .8;
    }
    bool hasTrailing = this.trailingWidget != null;

    List<Widget> rowChildren = [];
    if (hasTrailing)
      rowChildren.add(Flexible(
        flex: (isFullWidth) ? 1 : 2,
        fit: FlexFit.tight,
        child: Container(
          padding: (isFullWidth)
              ? EdgeInsets.symmetric(
                  horizontal: PetsTheme.getMoreSmallerPadMarg())
              : EdgeInsets.all(PetsTheme.getSmallPadMarg()),
          alignment: (isFullWidth) ? Alignment.center : Alignment.centerRight,
          child: SizedBox(child: trailingWidget),
        ),
      ));

    rowChildren.add(Flexible(
      flex: (isFullWidth) ? 3 : 2,
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
        alignment: (hasTrailing && !isFullWidth)
            ? Alignment.centerLeft
            : Alignment.center,
        child: FittedBox(
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: PetsTheme.getSmallFont()),
          ),
        ),
      ),
    ));

    return Container(
      alignment: Alignment.center,
      width: fieldsWidth,
      height: MediaQuery.of(context).size.height * 0.07,
      margin: EdgeInsets.all(PetsTheme.getSmallerPadMarg()),
      constraints: BoxConstraints(
          maxWidth: fieldsWidth,
          maxHeight: MediaQuery.of(context).size.height * 0.07),
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
              color:
                  (isBorder) ? PetsTheme.currentMainColor : Colors.transparent),
          borderRadius: BorderRadius.circular(PetsTheme.getMuchLargerFont())),
      child: FlatButton(
        onPressed: callBackFunction,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowChildren,
        ),
      ),
    );
  }
}
