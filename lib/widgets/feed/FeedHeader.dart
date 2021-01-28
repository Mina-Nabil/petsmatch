import 'package:flutter/material.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';

class FeedHeader extends StatelessWidget {
  final double userImageRatio = 0.2;
  final String userPlaceholderImage = "assets/images/icons/main/userPlaceholder.png";
  final double petImageRatio = .09;
  final String searchIconPath = "assets/images/icons/main/search.svg";
  final User mainUser;

  FeedHeader(this.mainUser);

  @override
  Widget build(BuildContext context) {
    List<Widget> petImages = [];
    if (mainUser.pets.length > 0) {
      mainUser.pets.forEach((element) {
        petImages.add(Container(margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()), child: UserAvatar(image: element.image, imageRatio: petImageRatio)));
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(PetsTheme.getLargestPadMarg()),
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: Container(alignment: Alignment.centerLeft, child: UserAvatar(image: mainUser.image, imageRatio: userImageRatio)),
          ),
          Flexible(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallestPadMarg()),
                        child: SizedBox(
                            child: Text(
                          "Welcome Back " + mainUser.name + "!",
                          style: TextStyle(
                              fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
                        )),
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      child: CircularPetButton(PetsTheme.currentMainColor.withOpacity(.2), searchIconPath, Colors.white),
                      onTap: () => Navigator.of(context).popAndPushNamed('/search'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: petImages,
            ),
          )
        ],
      ),
    );
  }
}
