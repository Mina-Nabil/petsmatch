import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/screens/login/CongratsScreen.dart';
import 'package:petmatch/screens/login/setUserPhoto.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/form/LabelledFormField.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SkipButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/form/regTextField.dart';
import 'package:provider/provider.dart';

class VetRegistrationScreen extends StatefulWidget {
  @override
  _VetRegistrationScreenState createState() => _VetRegistrationScreenState();
}

class _VetRegistrationScreenState extends State<VetRegistrationScreen> {
  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordNameController =
      new TextEditingController();
  final TextEditingController _confirmPasswordNameController =
      new TextEditingController();

  DateTime _dateOfBirth = new DateTime(2000, 1, 1);
  String dropdownValueGender = 'Male';
  String dropdownValueCountry = 'Egypt';
  String dropdownValueCity = 'Cairo';
  String dropdownValueTraining = 'Protection';
  final List<DropdownMenuItem> genderItems = <DropdownMenuItem>[
    DropdownMenuItem(
      child: Text("Male"),
    ),
    DropdownMenuItem(
      child: Text("Female"),
    ),
    DropdownMenuItem(
      child: Text("Prefer not to mention"),
    ),
  ];

  UserProvider userProvider;
  submitForm() {
    print("Submit aho");
    setState(() {
      //if(_formKey.currentState.validate()){
      Navigator.of(context).push(PageTransition(
          child: SetUserPhotoScreen(), type: PageTransitionType.fade));
      //}
    });
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context, listen: false);

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
      backgroundColor: bgColor.cyan,
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
              childField: DropdownButton<String>(
                value: dropdownValueGender,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueGender = newValue;
                  });
                },
                items: <String>['Male', 'Female', 'Do not specifiy']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          //DatePicker Widget
          LabelledFormField(
            label: "Birth Date",
            fieldHeight: maxDateFieldHeight,
            width: fieldsWidth,
            childField: CupertinoDatePicker(
              onDateTimeChanged: (newDate) {
                setState(() {
                  _dateOfBirth = newDate;
                });
              },
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime(2000),
            ),
          ),
          LabelledFormField(
              label: "Country",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueCountry,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValueCountry) {
                  setState(() {
                    dropdownValueCountry = newValueCountry;
                  });
                },
                items: <String>['Egypt', 'UAE', 'KSA']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          LabelledFormField(
              label: "City",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueCity,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValueCity) {
                  setState(() {
                    dropdownValueCity = newValueCity;
                  });
                },
                items: <String>['Alexandria', 'Cairo', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),

          SubmitButton(
            callBackFunction: () async {
              if (_passwordNameController.text !=
                      _confirmPasswordNameController.text &&
                  _passwordNameController.text != "")
                showModalBottomSheet(
                  context: context,
                  builder: (
                    BuildContext context,
                  ) =>
                      CupertinoPopupSurface(
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Center(
                          child: Text(
                            "The password doesn't match",
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              else {
                User antoin = new User(
                    name: _firstNameController.text + _lastNameController.text,
                    password: _passwordNameController.text.trim(),
                    email: _emailController.text.trim(),
                    usertype: "Trainer",
                    gender: dropdownValueGender,
                    dateOfBirth: _dateOfBirth,
                    country: dropdownValueCountry,
                    city: dropdownValueCity,
                    token: "");
                print(context);
                int status = await userProvider.signUp(antoin);
                print(userProvider.user.email);
                if (status == 200)
                  Navigator.of(context).push(new PageTransition(
                      child: CongratsScreen(), type: PageTransitionType.fade));
              }
            },
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(callBackFunction: null)
        ],
      ),
    );
  }
}
