import 'package:flutter/material.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';

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
        petImages.add(getCircularImage(context, element.image, petImageRatio));
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(PetsTheme.getLargestPadMarg(context)),
      height: double.infinity,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: getCircularImage(context, mainUser.image, userImageRatio),
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
                        margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallestPadMarg(context)),
                        child: SizedBox(
                            child: Text(
                          "Welcome Back " + mainUser.name + "!",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: PetsTheme.getMuchLargerFont(context),
                              color: PetsTheme.whiteBarColor,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircularPetButton(PetsTheme.currentMainColor.withOpacity(.2), searchIconPath, Colors.white),
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

  Container getCircularImage(BuildContext context, String image, double imageRatio) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: PetsTheme.getMuchLargerPadMarg(context)),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: ClipOval(
            child: FittedBox(
                child: FadeInImage(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * imageRatio,
              height: MediaQuery.of(context).size.width * imageRatio,
              image: NetworkImage(image),
              placeholder: AssetImage("assets/images/icons/main/userPlaceholder.png"),
            )),
          ),
        ));
  }
}
