import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import '../../providers/api_providers/pet_provider.dart';
import '../../providers/api_providers/user_provider.dart';
import 'package:provider/provider.dart';

class PetsListScreen extends StatelessWidget {
  List<Pet> pets = [];
  //   List<Pet> pets = [
  //     Pet("Roy", "https://connected-vet.com/wp-content/uploads/2020/11/e2ecf5d1-d17f-4fab-97cf-a77322c5566d.jpg", "Ahmed Abbas"),
  //     Pet("Lilly", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/why-cats-are-best-pets-worshipped-animals-1559234295.jpg", "Aya Ahmed"),
  // ];
  PetProvider petProvider;
  UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    petProvider = Provider.of<PetProvider>(context);
    petProvider.showMyPets(token: userProvider.user.token);

    return PetMatchSingleScreen(
        backArrow: true,
        title: Text(userProvider.user.name,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: PetsTheme.getMuchLargerFont(),
                color: PetsTheme.whiteBarColor,
                fontWeight: FontWeight.bold)),
        bodyBackgroundColor: Colors.white,
        body: ListView(padding: EdgeInsets.zero, children: [
          //people
          if (pets.isNotEmpty)
            Container(
              margin: EdgeInsets.only(bottom: PetsTheme.getLargerPadMarg()),
              padding: EdgeInsets.all(PetsTheme.getLargerPadMarg()),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin:
                          EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
                      child: Text(
                        "Pets",
                        style: TextStyle(
                            fontSize: PetsTheme.getLargeFont(),
                            fontWeight: FontWeight.bold,
                            color: PetsTheme.currentMainColor),
                      )),
                  ...petProvider.pets.map((e) {
                    return Column(children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: PetsTheme.getSmallPadMarg()),
                        leading: UserAvatar(
                          image: e.image,
                          imageRatio: 1,
                        ),
                        title: Text(
                          e.name,
                          style: TextStyle(
                              color: PetsTheme.blackTextColor,
                              fontSize: PetsTheme.getMeduimFont(),
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: RoundButton(
                          child: FittedBox(
                              child: Text(
                            "Following",
                            style: TextStyle(
                                fontSize: PetsTheme.getSmallFont(),
                                color: PetsTheme.currentMainColor),
                          )),
                          color: Colors.white,
                          borderColor: PetsTheme.currentMainColor,
                          height: 30,
                          width: MediaQuery.of(context).size.width /
                              4, // good for SmallFont
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ]);
                  }).toList(),
                ],
              ),
            ),
        ]));
  }
}
