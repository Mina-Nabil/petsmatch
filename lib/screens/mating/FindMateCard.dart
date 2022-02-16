import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/providers/api_providers/crush_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/Pair.dart';
import 'package:petmatch/widgets/custom/PetMatchRating.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:provider/provider.dart';

class FindMatingCard extends StatefulWidget {
  FindMatingCard(this.pet);
  final Pet pet;

  @override
  State<FindMatingCard> createState() => _FindMatingCardState();
}

class _FindMatingCardState extends State<FindMatingCard> {
  void initState() {
    crushProvider = Provider.of<CrushProvider>(context, listen: false);
    circularButton = CircularButton(
        child: SvgPicture.asset(matingImg),
        radius: PetsTheme.radius3,
        backgroundColor: Colors.red[50],
        onPressed: () {
          crush();
        });
    super.initState();
  }

  String matingImg = "assets/images/icons/mating/matingLove.svg";

  CrushProvider crushProvider;
  void crush() async {
    print(widget.pet);
    int status = await crushProvider.createCrush(widget.pet, context);
    if (status > 200 && status < 300) {
      matingImg = "assets/images/icons/mating/matingLoved.png";
      circularButton = CircularButton(
          child: SvgPicture.asset(matingImg),
          radius: PetsTheme.radius3,
          backgroundColor: Colors.green[50],
          onPressed: () {
            crush();
          });
    }
  }

  Widget circularButton;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
            child: Image.network(
              widget.pet.image,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          )),
          SizedBox(
            height: PetsTheme.getMeduimPadMarg(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.pet.name,
                                style: TextStyle(
                                    fontSize: PetsTheme.getLargerFont(),
                                    fontWeight: FontWeight.bold,
                                    color: PetsTheme.blackTextColor),
                              ),
                              Text("20 Miles away",
                                  style: TextStyle(
                                    fontSize: PetsTheme.getMeduimFont(),
                                    color: Colors.grey[600],
                                  )),
                            ]),
                        circularButton
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: PetsTheme.getSmallPadMarg()),
                    child: Text("View profile",
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            color: PetsTheme.currentMainColor,
                            fontWeight: FontWeight.w500)),
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                                color: PetsTheme.commentBgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: PetsTheme.radius2,
                                    backgroundImage: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6zes53m4a_2VLTcmTn_bHk8NO5SkuWfcQbg&usqp=CAU")
                                        .image,
                                  ),
                                  SizedBox(
                                    width: PetsTheme.getSmallPadMarg(),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                          child: Text(
                                        "Owner",
                                        style: TextStyle(
                                            color: PetsTheme.currentMainColor),
                                      )),
                                      FittedBox(child: Text(widget.pet.owner)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                                color: PetsTheme.commentBgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Pair(
                                FittedBox(
                                    child: Text(
                                  "Breed",
                                  style: TextStyle(
                                      color: PetsTheme.currentMainColor),
                                )),
                                FittedBox(child: Text("Golden")),
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                                color: PetsTheme.commentBgColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Pair(
                                FittedBox(
                                    child: Text(
                                  "Age",
                                  style: TextStyle(
                                      color: PetsTheme.currentMainColor),
                                )),
                                FittedBox(child: Text("6 months")),
                              ),
                            ),
                          )),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/paw.svg",
                        color: PetsTheme.currentMainColor,
                        width: 16,
                      ),
                      SizedBox(
                        width: PetsTheme.getSmallestPadMarg(),
                      ),
                      PetMatchRating(
                          rate: 4,
                          size: PetsTheme.getSmallFont(),
                          ratedColor: PetsTheme.currentMainColor,
                          unratedColor: Colors.grey),

                      SizedBox(
                        width: PetsTheme.getLargePadMarg(),
                      ),

                      Icon(
                        Icons.person,
                        size: 20,
                        color: PetsTheme.currentMainColor,
                      ),
                      PetMatchRating(
                          rate: 3,
                          size: PetsTheme.getSmallFont(),
                          ratedColor: PetsTheme.currentMainColor,
                          unratedColor: Colors.grey),

                      Expanded(child: Container()),

                      //reviews
                      GestureDetector(
                        child: Text(
                          "40 Reviews",
                          style: TextStyle(color: PetsTheme.currentMainColor),
                        ),
                        onTap: () => Navigator.of(context)
                            .pushNamed("Mating/PetReviews"),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
