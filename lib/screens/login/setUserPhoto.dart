import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/screens/basescreen.dart';
import 'package:petmatch/screens/login/VerifyMail.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/LoginScreenSetup.dart';
import 'package:petmatch/widgets/PetsButton.dart';
import 'package:petmatch/widgets/SkipButton.dart';
import 'package:petmatch/widgets/SubmitButton.dart';

class SetUserPhotoScreen extends StatefulWidget {
  @override
  _SetUserPhotoScreenState createState() => _SetUserPhotoScreenState();
}

class _SetUserPhotoScreenState extends State<SetUserPhotoScreen> {
  bool inProcess = false;
  File _selectedImage;

  getImage(ImageSource source) async {
    setState(() {
      inProcess = true;
    });
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: source);
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(),
          iosUiSettings: IOSUiSettings(
            showCancelConfirmationDialog: true,
          ));
      if (croppedImage != null) {
        _selectedImage = croppedImage;
      }
    }
    setState(() {
      inProcess = false;
    });
  }

  submitPhoto(){
        Navigator.push(context, new PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 500), child: VerifyMailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double photoDiameterRatio = 0.4;

    var imagePlaceholder = Container(
        margin: EdgeInsets.symmetric(horizontal: PetsTheme.getMuchLargerPadMarg(context)),
        width: MediaQuery.of(context).size.width * photoDiameterRatio,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: PetsTheme.currentMainColor.withOpacity(.2),
        ),
        child: Container(
          child: FractionallySizedBox(
            heightFactor: 0.65,
            widthFactor: 0.65,
            child: SvgPicture.asset(
              Paths.owner_icon_file,
              color: PetsTheme.currentMainColor,
            ),
          ),
        ));
    return Stack(
      children: [
        LoginScreenSetup(
          topbarTitle: "Step 2",
          topbarSubtitle: "Add your Profile Picture",
          showLogo: false,
          isSmallTopArea: true,
          smalFormTitle: true,
          isBottomScrollable: false,
          backgroundColor: bgColor.main,
          formTitleAlignment: Alignment.centerLeft,
          formWidget: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 3,
                  child: (_selectedImage == null)
                      ? imagePlaceholder
                      : ClipOval(
                          child: Image.file(_selectedImage),
                        )),
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PetsButton(
                        callBackFunction: () => getImage(ImageSource.camera),
                        buttonText: "Take a Photo",
                        isBorder: true,
                        fieldsWidth: MediaQuery.of(context).size.width * 0.35,
                        textColor: PetsTheme.currentMainColor,
                        trailingWidget: SvgPicture.asset(
                          Paths.camera_icon_file,
                          color: PetsTheme.currentMainColor,
                        ),
                        isFullWidth: true,
                      ),
                      PetsButton(
                        callBackFunction: () => getImage(ImageSource.gallery),
                        buttonText: "Open My Gallery",
                        isBorder: true,
                        fieldsWidth: MediaQuery.of(context).size.width * 0.35,
                        textColor: PetsTheme.currentMainColor,
                        trailingWidget: SvgPicture.asset(
                          Paths.gallery_icon_file,
                          color: PetsTheme.currentMainColor,
                        ),
                        isFullWidth: true,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(flex: 1, child: Container()),
              Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      SubmitButton(
                        callBackFunction: submitPhoto,
                        buttonText: "Next",
                        isShowPaws: false,
                      ),
                      SkipButton(callBackFunction: null)
                    ],
                  )),
            ],
          ),
        ),
        (inProcess)
            ? Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(backgroundColor: PetsTheme.currentMainColor,),
                ))
            : Container()
      ],
    );
  }
}
