import 'package:flutter/material.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/settings/paths.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/SizedCircularIconButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';

class NewPostWidget extends StatelessWidget {
  final double maxHeightRatio = .2;
  final double minHeightRatio = .12;

  final TextEditingController _postController = new TextEditingController();

  final user = new User("Hamada", "https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw",  "mina@stmary",);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height * minHeightRatio, maxHeight: MediaQuery.of(context).size.height * maxHeightRatio),
        padding: EdgeInsets.symmetric(horizontal: PetsTheme.getLargerPadMarg(), vertical: PetsTheme.getMeduimPadMarg()),
        margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: PetsTheme.getSmallPadMarg()),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()), child: UserAvatar(image: user.image, imageRatio: .2))),
                  Flexible(
                    flex: 6,
                    child: Container(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Share your thoughts...", hintStyle: TextStyle(fontFamily: "Roboto"), border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsRedColor,
                    bgColor: PetsTheme.petsRedBg,
                    iconPath: Paths.video_icon_svg,
                    buttonCallback: () {},
                  ),
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsGreenColor,
                    bgColor: PetsTheme.petsGreenBg,
                    iconPath: Paths.gallery_icon_svg,
                    buttonCallback: null,
                  ),
                  SizedCircularIconButton(
                    iconColor: PetsTheme.petsBlueColor,
                    bgColor: PetsTheme.petsBlueBg,
                    iconPath: Paths.location_icon_svg,
                    buttonCallback: null,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
