import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/screens/login/CongratsScreen.dart';
import 'package:petmatch/screens/profile/ProfileScreen.dart';
import 'package:petmatch/widgets/form/LabelledFormField.dart';
import 'package:petmatch/widgets/screens/LoginScreenSetup.dart';
import 'package:petmatch/widgets/buttons/SkipButton.dart';
import 'package:petmatch/widgets/buttons/SubmitButton.dart';
import 'package:petmatch/widgets/form/regTextField.dart';
import '../../providers/api_providers/user_provider.dart';
import 'package:provider/provider.dart';

class PetRegistrationScreen extends StatefulWidget {
  @override
  _PetRegistrationScreen createState() => _PetRegistrationScreen();
}

class _PetRegistrationScreen extends State<PetRegistrationScreen> {
  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordNameController =
      new TextEditingController();
  final TextEditingController _confirmPasswordNameController =
      new TextEditingController();

  UserProvider userProvider;
  PetProvider petProvider;

  User mainUser;

  String _genderController;
  DateTime _dateOfBirth = new DateTime(2000, 1, 1);
  String _country;
  String _city;
  String dropdownValueGender = 'Male';
  String dropdownValueBreed = 'Chuaua';
  String dropdownValuePure = 'Yes';
  String dropdownValueTrained = 'Yes';
  String dropdownValueVaccinated = 'Yes';
  String dropdownValueMating = 'Yes';

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

  void initState() {
    Future.delayed(Duration.zero).then((value) => callProvider());

    super.initState();
  }

  void callProvider() async {
    setState(() {
      userProvider = Provider.of<UserProvider>(context, listen: false);
      petProvider = Provider.of<PetProvider>(context, listen: false);
      mainUser = userProvider.user;
      print(mainUser.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    double fieldsWidth = MediaQuery.of(context).size.width * 0.8;
    double minFieldHeight = 30;
    double maxFieldHeight = 70;
    double maxDateFieldHeight = 130;

    return LoginScreenSetup(
      formTitle: "Pet Information",
      topbarTitle: " ",
      topbarSubtitle: "Create your Pet's Account",
      showLogo: false,
      isSmallTopArea: true,
      smalFormTitle: true,
      isBottomScrollable: true,
      formTitleAlignment: Alignment.centerLeft,
      formWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RegTextField(
            label: "Pet Name",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _firstNameController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Pet Type",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            controller: _emailController,
            fieldsWidth: fieldsWidth,
          ),
          RegTextField(
            label: "Age",
            maxFieldHeight: maxFieldHeight,
            minFieldHeight: minFieldHeight,
            obscureText: true,
            controller: _passwordNameController,
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
              label: "Breed",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueBreed,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValueBreed) {
                  setState(() {
                    dropdownValueBreed = newValueBreed;
                  });
                },
                items: <String>['Chuaua', 'Golden', 'Huskey']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          LabelledFormField(
              label: "Pure",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValuePure,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValuePure) {
                  setState(() {
                    dropdownValuePure = newValuePure;
                  });
                },
                items: <String>['Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),

          LabelledFormField(
              label: "Trained",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueTrained,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValueTrained) {
                  setState(() {
                    dropdownValueTrained = newValueTrained;
                  });
                },
                items: <String>['Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          LabelledFormField(
              label: "Vaccinated",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueVaccinated,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.grey),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String newValueVaccinated) {
                  setState(() {
                    dropdownValueVaccinated = newValueVaccinated;
                  });
                },
                items: <String>['Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          LabelledFormField(
              label: "Is he available for mating",
              fieldHeight: maxFieldHeight,
              width: fieldsWidth,
              childField: DropdownButton<String>(
                value: dropdownValueMating,
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
                    dropdownValueMating = newValueCity;
                  });
                },
                items: <String>['Yes', 'No']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),

          SubmitButton(
            callBackFunction: () async {
              print('before pet');
              Pet pet = new Pet(
                  name: _firstNameController.text,
                  dob: _dateOfBirth,
                  owner: "owner",
                  image: "");
              print(mainUser.token);
              int status = await petProvider.addPet(pet, mainUser.token);
              if (status >= 200 && status < 300)
                Navigator.of(context).push(new PageTransition(
                    child: ProfileScreen(), type: PageTransitionType.fade));
              else
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
                            userProvider.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
            },
            buttonText: "Next",
            isShowPaws: false,
          ),
          SkipButton(
              callBackFunction: () => Navigator.of(context).push(
                  new PageTransition(
                      child: ProfileScreen(), type: PageTransitionType.fade))),
        ],
      ),
    );
  }
}
