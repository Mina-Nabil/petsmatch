import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/sendPhoneCode.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/regTextField.dart';

class OwnerRegScreen extends StatefulWidget {
  @override
  _OwnerRegScreenState createState() => _OwnerRegScreenState();
}

class _OwnerRegScreenState extends State<OwnerRegScreen> {
  //Reg Form
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();

//Submit Form Function
  void submitForm() {
    print("Submit aho");
    setState(() {
      //if(_formKey.currentState.validate()){
        Navigator.of(context).push(PageTransition(child: VerifyPhoneCodeScreen(), type: PageTransitionType.fade));
      //}
      

    });
  }

  @override
  Widget build(BuildContext context) {
    //Fields dimensions
    double fieldsWidth = MediaQuery.of(context).size.width * .9;
    double maxFieldHeight = MediaQuery.of(context).size.height * .15 ;
    double minFieldHeight = MediaQuery.of(context).size.height * .1 ;
    double finalFieldsWidth = MediaQuery.of(context).size.width * .8;

    //Screen dimensions
    double minScreenHeight = (MediaQuery.of(context).size.height > PetsTheme.bigScreenHeight) ?  MediaQuery.of(context).size.height * .8  : MediaQuery.of(context).size.height ;
    double maxScreenHeight = (MediaQuery.of(context).size.height > PetsTheme.bigScreenHeight) ?  MediaQuery.of(context).size.height * 1.15 : MediaQuery.of(context).size.height*1.5;

    return BaseScreen(
      titleText: "Owner's Registration",
      isKeyBoardChangeSize: true,
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              constraints: BoxConstraints(
                  minHeight: minScreenHeight,
                  maxHeight: maxScreenHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //First Name
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "First Name",
                      fieldsWidth: fieldsWidth,
                      maxFieldHeight: maxFieldHeight,
                      minFieldHeight: minFieldHeight,
                      controller: _firstNameController,
                      isRequired: true,
                    ),
                  ),
                  //Last Name
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "Last Name",
                      fieldsWidth: fieldsWidth,
                      maxFieldHeight: maxFieldHeight,
                      minFieldHeight: minFieldHeight,
                      controller: _lastNameController,
                      isRequired: true,
                    ),
                  ),
                  //Age
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "Age",
                      fieldsWidth: fieldsWidth,
                      minFieldHeight: minFieldHeight,
                      maxFieldHeight: maxFieldHeight,
                      validateNumber: true,
                      controller: _ageController,
                      isRequired: true,
                    ),
                  ),
                  //Email
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "Email",
                      fieldsWidth: fieldsWidth,
                      maxFieldHeight: maxFieldHeight,
                      validateEmail: true,
                      minFieldHeight: minFieldHeight,
                      controller: _emailController,
                      isRequired: true,
                    ),
                  ),
                  //Password
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "Password",
                      fieldsWidth: fieldsWidth,
                      maxFieldHeight: maxFieldHeight,
                      minFieldHeight: minFieldHeight,
                      controller: _passController,
                      isRequired: true,
                      obscureText: true,
                    ),
                  ),
                  //ConfPassword
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                      label: "Confirm Password",
                      fieldsWidth: fieldsWidth,
                      maxFieldHeight: maxFieldHeight,
                      minFieldHeight: minFieldHeight,
                      controller: _confPassController,
                      isRequired: true,
                      obscureText: true,
                    ),
                  ),
                  //Country
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: RegTextField(
                        label: "Country",
                        fieldsWidth: fieldsWidth,
                        maxFieldHeight: maxFieldHeight,
                        minFieldHeight: minFieldHeight,
                        controller: _countryController),
                  ),
                  //City

                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          top: PetsTheme.getLargePadMarg(context)),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                flex: 5,
                                fit: FlexFit.loose,
                                child: RegTextField(
                                  label: "City",
                                  fieldsWidth: finalFieldsWidth,
                                  maxFieldHeight: maxFieldHeight,
                                  minFieldHeight: minFieldHeight,
                                  controller: _cityController,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: FlatButton(
                                  padding: EdgeInsets.all(0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(0),
                                    child:
                                        FaIcon(FontAwesomeIcons.chevronRight),
                                  ),
                                  onPressed: submitForm,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //Ending Spacing
                 // Flexible(flex: 1, child: Container()),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
