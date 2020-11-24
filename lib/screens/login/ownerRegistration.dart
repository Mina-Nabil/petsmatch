import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/login/setUserPhoto.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/form/LabelledFormField.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SkipButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/form/regTextField.dart';

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
    double fieldsWidth = MediaQuery.of(context).size.width * 0.8;
    double minFieldHeight = 30;
    double maxFieldHeight = 70;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          RegTextField(
            label: "First Name",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _firstNameController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Last Name",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _lastNameController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Email",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _emailController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Password",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            obscureText: true,
            controller: _passwordNameController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Confirm Password",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            obscureText: true,
            controller: _confirmPasswordNameController,
            fieldsWidth: fieldsWidth,
          ),
          LabelledFormField(
              label: "Gender",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont()),
                onChanged: citySelected,
                items: [
                  DropdownMenuItem(
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    child: Text("Prefer not to mention"),
                  ),
                ],
              )),
          //DatePicker Widget
          LabelledFormField(
            label: "Birth Date",
            fieldHeight: maxDateFieldHeight,
            width: fieldsWidth,
            childField: CupertinoDatePicker(
              onDateTimeChanged: (newDate) => setDate(newDate),
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2000),
            ),
          ),
          LabelledFormField(
              label: "Country",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont()),
                onChanged: citySelected,
                items: [
                  DropdownMenuItem(
                    child: Text("Egypt"),
                  ),
                  DropdownMenuItem(
                    child: Text("UAE"),
                  ),
                  DropdownMenuItem(
                    child: Text("Rehab"),
                  ),
                ],
              )),
          LabelledFormField(
              label: "City",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont()),
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
            callBackFunction: () => Navigator.of(context).push(new PageTransition(child: SetUserPhotoScreen(), type: PageTransitionType.fade)),
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(callBackFunction: null)
        ],
      ),
    );
  }
}
