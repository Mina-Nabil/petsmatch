import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/setUserPhoto.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/form/LabelledFormField.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SkipButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/form/regTextField.dart';

class TrainerRegistrationScreen extends StatefulWidget {
  @override
  _TrainerRegistrationScreenState createState() => _TrainerRegistrationScreenState();
}

class _TrainerRegistrationScreenState extends State<TrainerRegistrationScreen> {
  final TextEditingController _firstNameController = new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordNameController = new TextEditingController();
  final TextEditingController _confirmPasswordNameController = new TextEditingController();
  final TextEditingController _yearsExpController = new TextEditingController();
  final TextEditingController _relatedOrgController = new TextEditingController();
  final TextEditingController _aboutController = new TextEditingController();

  DateTime birthDate = null;

  //Submit Form Function
  void submitForm() {
    print("Submit aho");
    setState(() {
      //if(_formKey.currentState.validate()){
        Navigator.of(context).push(PageTransition(child: SetUserPhotoScreen(), type: PageTransitionType.fade));
      //}
      

    });
  }

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
      backgroundColor: bgColor.purple,
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
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont(context)),
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
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont(context)),
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
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont(context)),
                onChanged: citySelected,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Cairo",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Alex",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Giza",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                ],
              )),
          LabelledFormField(
              label: "Training Type",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButtonFormField(
                decoration: InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(fontFamily: "Roboto", color: Colors.black, fontSize: PetsTheme.getLargeFont(context)),
                onChanged: citySelected,
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Protection",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Orders",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Bulking",
                      style: TextStyle(fontFamily: "Roboto"),
                    ),
                  ),
                ],
              )),
          RegTextField(
            label: "Years of Experience",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _yearsExpController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Related Organization",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _relatedOrgController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "About",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _aboutController,
            fieldsWidth: fieldsWidth,
          ),

          SubmitButton(
            callBackFunction: submitForm,
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(callBackFunction: null)
        ],
      ),
    );
  }
}
