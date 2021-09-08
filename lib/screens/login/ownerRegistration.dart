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
import '../../models/user.dart';
import '../../providers/api_providers/user_provider.dart';

class OwnerRegistrationScreen extends StatefulWidget {
  @override
  _OwnerRegistrationScreenState createState() =>
      _OwnerRegistrationScreenState();
}

class _OwnerRegistrationScreenState extends State<OwnerRegistrationScreen> {
  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordNameController =
      new TextEditingController();
  final TextEditingController _confirmPasswordNameController =
      new TextEditingController();
  UserProvider userProvider;

  String _genderController;
  DateTime _dateOfBirth;
  String _country;
  String _city;

  DateTime birthDate = null;

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
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: PetsTheme.getLargeFont()),
                onChanged: citySelected,
                items: genderItems,
                value: _genderController,
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
              childField: DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: PetsTheme.getLargeFont()),
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
                value: _country,
              )),
          LabelledFormField(
              label: "City",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButtonFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: PetsTheme.petsBordersGrayColor))),
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: PetsTheme.getLargeFont()),
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
                value: _city,
              )),

          SubmitButton(
            callBackFunction: () => Navigator.of(context).push(
                new PageTransition(
                    child: SetUserPhotoScreen(),
                    type: PageTransitionType.fade)),
            // userProvider.signUp(
            //     User(
            //       name: _firstNameController.text + _lastNameController.text,
            //       password: _passwordNameController.text.trim(),
            //       email: _emailController.text.trim(),
            //       usertype: "Pet Owner",
            //       gender: _genderController,
            //       dateOfBirth: _dateOfBirth,
            //       country: _country,
            //       city: _city,
            //       token: "",

            //name=${user.name}" +
            // "&password=${user.password}" +
            // "&email=${user.email}" +
            // "&image=${user.image}" +
            // "&gender=${user.gender}" +
            // "&phone=${user.phone}" +
            // "&dateOfBirth=${user.dateOfBirth}" +
            // "&country=${user.country}" +
            // "&city=${user.city}" +
            // "&token=${user.token}" +
            // "&type=${user.usertype}";
            // ),
            // context),
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(callBackFunction: null),
        ],
      ),
    );
  }
}
