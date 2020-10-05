import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/LabelledFormField.dart';
import 'package:petmatch/widgets/LoginScreenSetup.dart';
import 'package:petmatch/widgets/SkipButton.dart';
import 'package:petmatch/widgets/SubmitButton.dart';
import 'package:petmatch/widgets/regTextField.dart';

class OwnerRegistrationScreen extends StatefulWidget {
  @override
  _OwnerRegistrationScreenState createState() => _OwnerRegistrationScreenState();
}

class _OwnerRegistrationScreenState extends State<OwnerRegistrationScreen> {
  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordNameController = new TextEditingController();
  final TextEditingController _confirmPasswordNameController = new TextEditingController();

  DateTime birthDate = null;

  setDate(newDate) {
    birthDate = newDate;
  }

  citySelected(selected) {}

  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * 0.7;
    double minFieldHeight = 30;
    double maxFieldHeight = 90;
    double maxDateFieldHeight = 130;

    return LoginScreenSetup(
      formTitle: "Personal Information",
      topbarTitle: "Step 1",
      topbarSubtitle: "Create your Account",
      showLogo: false,
      isSmallTopArea: true,
      smalFormTitle: true,
      isBottomScrollable: true,
      formTitleAlignment: Alignment.centerLeft,
      formWidget: Column(
        children: [
          RegTextField(
            label: "First Name",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _firstNameController,
            fieldsWidth: MediaQuery.of(context).size.width * .75,
          ),
          RegTextField(
            label: "Last Name",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _lastNameController,
            fieldsWidth: MediaQuery.of(context).size.width * .75,
          ),
          RegTextField(
            label: "Email",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _emailController,
            fieldsWidth: MediaQuery.of(context).size.width * .75,
          ),
          RegTextField(
            label: "Password",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            obscureText: true,
            controller: _passwordNameController,
            fieldsWidth: MediaQuery.of(context).size.width * .75,
          ),
          RegTextField(
            label: "Confirm Password",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            obscureText: true,
            controller: _confirmPasswordNameController,
            fieldsWidth: MediaQuery.of(context).size.width * .75,
          ),
          //DatePicker Widget
          LabelledFormField(
            label: "Birth Date",
            fieldHeight: maxDateFieldHeight,
            childField: CupertinoDatePicker(
              onDateTimeChanged: (newDate) => setDate(newDate),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2000),
            ),
          ),
          LabelledFormField(
              label: "City",
              fieldHeight: maxFieldHeight,
              childField: DropdownButtonFormField(
                onChanged: citySelected,
                items: [
                  DropdownMenuItem(
                    child: Text("Cairo"),
                  ),
                  DropdownMenuItem(
                    child: Text("Alex"),
                  ),
                  DropdownMenuItem(
                    child: Text("Giza"),
                  ),
                ],
              )),
          SubmitButton(
            callBackFunction: null,
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(callBackFunction: null)
        ],
      ),
    );
  }
}
