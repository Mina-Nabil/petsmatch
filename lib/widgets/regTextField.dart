import 'package:flutter/material.dart';
import '../theme/petsTheme.dart';
import 'package:validators/validators.dart';
import 'package:validators/sanitizers.dart';

class RegTextField extends StatelessWidget {
  const RegTextField({
    Key key,
    @required this.fieldsWidth,
    @required this.label,
    @required this.maxFieldHeight,
    @required this.minFieldHeight,
    @required TextEditingController controller,
    TextInputType keyboard = TextInputType.text,
    this.isRequired = false,
    this.obscureText = false,
    this.validateEmail = false,
    this.validateNumber = false,
    this.minLines = 1,
    this.maxLines = 1,
  })  : _controller = controller,
        super(key: key);

  final double fieldsWidth;
  final double maxFieldHeight;
  final double minFieldHeight;
  final int minLines;
  final int maxLines;
  final bool isRequired;
  final bool obscureText;
  final bool validateEmail;
  final bool validateNumber;
  final String label;
  final TextEditingController _controller;

  String validatorFunc(context, value) {
    if (isRequired && (value.length <= 0)) {
      snackBarThis(context, label + " is required");
      return "Required";
    }
    if (validateEmail && (!isEmail(trim(value)))) {
      snackBarThis(context, label + " is not a valid mail address");
      return "Invalid email";
    }
    if (validateNumber && (!isNumeric(trim(value)))) {
      snackBarThis(context, label + " is not a valid mail address");
      return "Invalid Number";
    }
    return null;
  }

  void snackBarThis(context, message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(fontFamily: "Segoe"),
      ),
      duration: Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: PetsTheme.getLargePadMarg(context)),
      constraints: BoxConstraints(maxWidth: fieldsWidth, maxHeight: maxFieldHeight, minHeight: minFieldHeight),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg(context)),
            child: Text(label, style: TextStyle(fontSize: PetsTheme.getLargeFont(context), fontFamily: "Oregano")),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallerPadMarg(context)),
                      child: Padding(
                          padding: EdgeInsets.only(left: PetsTheme.getMeduimPadMarg(context)),
                          child: TextFormField(
                            controller: _controller,
                            obscureText: obscureText,
                            maxLines: maxLines,
                            minLines: minLines,
                            validator: (this.isRequired) ? (value) => validatorFunc(context, value) : (value) => null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: PetsTheme.fieldsBackGroundColor,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.black, width: 2)),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: PetsTheme.darkBgColor, width: 2)),
                            ),
                            style: TextStyle(fontFamily: "Segoe", fontSize: PetsTheme.getLargeFont(context)),
                          )))),
            ],
          )
        ],
      ),
    );
  }
}
