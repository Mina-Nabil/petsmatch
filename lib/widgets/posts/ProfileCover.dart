import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/screens/login/petRegistration.dart';
import 'package:petmatch/screens/post_screens/PostScreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/Pair.dart';
import 'package:petmatch/widgets/custom/PetMatchRating.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/buttons/RoundButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';

abstract class ProfileCover extends StatefulWidget {
  factory ProfileCover(User activeUser) {
    print(activeUser.name);
    switch (PetsTheme.accountType) {
      case AccountType.petOwner:
        if (activeUser != null) return PetOwnerProfileCover(activeUser);
        break;
      case AccountType.trainer:
        return TrainerProfileCover(activeUser);
      case AccountType.vet:
        return VetProfileCover(activeUser);
      case AccountType.store:
        return StoreProfileCover(activeUser);
      default:
        return PetOwnerProfileCover(activeUser);
    }
  }
}

class PetOwnerProfileCover extends StatefulWidget implements ProfileCover {
  User activeUser;
  PetOwnerProfileCover(this.activeUser);
  @override
  State<PetOwnerProfileCover> createState() => _PetOwnerProfileCoverState();
}

class _PetOwnerProfileCoverState extends State<PetOwnerProfileCover> {
  UserProvider userProvider;
  PetProvider petProvider;

  List<Widget> petsWidgets = [];

  int status;

  bool done = false;
  List<Pet> pets;
  User mainUser;
  void initState() {
    Future.delayed(Duration.zero).then((value) => updatePets());
    super.initState();
  }

  void updatePets() async {
    /* whatever */

    userProvider = Provider.of<UserProvider>(context, listen: false);
    petProvider = Provider.of<PetProvider>(context, listen: false);
    mainUser.id == userProvider.user.id
        ? status = await petProvider.showMyPets(token: userProvider.user.token)
        : status = 404;

    print('${status} these are the status');
    if (status >= 200 && status < 300) {
      pets = petProvider.pets;

      setState(() {
        mainUser.addAllPet(pets);

        done = true;
        if (done)
          petsWidgets = [
            for (var pet in mainUser.pets)
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.symmetric(
                            vertical: PetsTheme.getSmallPadMarg()),
                        child: UserAvatar(
                          image: pet.image,
                          imageRatio: 1,
                        ),
                      ),
                      Text(
                        pet.name,
                        style: TextStyle(
                            fontSize: PetsTheme.getMeduimFont(),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onTap: (() {
                  print(pet);
                  petProvider.setSelectedPet(pet);
                  Navigator.pushNamed(context, 'petProfile');
                }),
              )
          ];
        print("${done} it is");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    petProvider = Provider.of<PetProvider>(context);
    mainUser = widget.activeUser;

    // mainUser = User(
    //     name: userProvider.user.name,
    //     image: userProvider.user.image,
    //     email: userProvider.user.email);
    // print(mainUser.pets.first);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //pp & data
          Row(
            children: [
              Container(
                height: PetsTheme.radius6 * 2,
                width: PetsTheme.radius6 * 2,
                child: UserAvatar(
                  image: mainUser.image,
                  imageRatio: 1,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mainUser.name,
                        style: TextStyle(
                            fontSize: PetsTheme.getLargerFont(),
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: petsWidgets),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),
          //buttons
          mainUser.id == userProvider.user.id
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundButton(
                      child: FittedBox(
                          child: Text(
                        "Add a pet",
                        style: TextStyle(
                            fontSize: PetsTheme.getSmallFont(),
                            color: PetsTheme.currentMainColor),
                      )),
                      onPressed: () => Navigator.of(context).pushReplacement(
                          new PageTransition(
                              child: PetRegistrationScreen(),
                              type: PageTransitionType.fade)),
                      color: Colors.white,
                      height: 30,
                      width: MediaQuery.of(context).size.width /
                          3, // good for SmallFont
                    ),
                    RoundButton(
                      child: FittedBox(
                          child: Text(
                        "Friends",
                        style: TextStyle(
                            fontSize: PetsTheme.getSmallFont(),
                            color: Colors.white),
                      )),
                      borderColor: Colors.white,
                      height: 30,
                      width: MediaQuery.of(context).size.width /
                          3, // good for SmallFont
                    ),
                    CircularMoreButton(
                      radius: 15,
                      color: Colors.white,
                      backgroundColor: Color.fromRGBO(20, 44, 122, 0.5),
                      onPressed: () =>
                          Navigator.pushNamed(context, 'Pet/Registration'),
                    ),
                  ],
                )
              : Row(),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),

          //friends & pets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Pair(
                  Text("0",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Friends",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'friends'),
              ),
              GestureDetector(
                child: Pair(
                  Text("0",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Pets",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'pets'),
              ),
              GestureDetector(
                child: Pair(
                  Text("0",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Reviews",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Reviews");
                },
              ),
              GestureDetector(
                child: Pair(
                  Text("0",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Photos",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'photos'),
              ),
            ],
          ),
          SizedBox(
            height: PetsTheme.getLargePadMarg(),
          ),
        ],
      ),
    );
  }
}

class TrainerProfileCover extends StatefulWidget implements ProfileCover {
  User activeUser;
  TrainerProfileCover(this.activeUser);
  @override
  State<TrainerProfileCover> createState() => _TrainerProfileCoverState();
}

class _TrainerProfileCoverState extends State<TrainerProfileCover> {
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CommercialCover(
            name: userProvider.user.name,
            image: userProvider.user.image,
            rate: 5,
            title: "Trainer",
            shortDescription: userProvider.user.about,
          ),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),

          //friends & pets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Pair(
                  Text("450",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Followers",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'friends'),
              ),
              GestureDetector(
                child: Pair(
                  Text("2",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Trained Pets",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'pets'),
              ),
              GestureDetector(
                child: Pair(
                  Text("30",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Reviews",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Reviews");
                },
              ),
              GestureDetector(
                child: Pair(
                  Text("45",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Photos",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Photos");
                },
              ),
            ],
          ),
          SizedBox(
            height: PetsTheme.getLargePadMarg(),
          ),
        ],
      ),
    );
  }
}

// Vet profile & Store Profile can be same widget
class VetProfileCover extends StatefulWidget implements ProfileCover {
  User activeUser;
  VetProfileCover(this.activeUser);
  @override
  State<VetProfileCover> createState() => _VetProfileCoverState();
}

class _VetProfileCoverState extends State<VetProfileCover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CommercialCover(
            name: "VetPoint",
            image:
                "https://thevetservice.com/wp-content/uploads/2019/06/options-huge-vet-bill.jpg",
            rate: 4,
            title: "Veterinary Clinic",
            shortDescription: "Lorem Ipsum is simply dummy text",
          ),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),

          //friends & pets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Pair(
                  Text("450",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Followers",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'friends'),
              ),
              GestureDetector(
                child: Pair(
                  Text("30",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Reviews",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Reviews");
                },
              ),
              GestureDetector(
                child: Pair(
                  Text("45",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Photos",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Photos");
                },
              ),
            ],
          ),
          SizedBox(
            height: PetsTheme.getLargePadMarg(),
          ),
        ],
      ),
    );
  }
}

class StoreProfileCover extends StatefulWidget implements ProfileCover {
  User activeUser;
  StoreProfileCover(this.activeUser);
  @override
  State<StoreProfileCover> createState() => _StoreProfileCoverState();
}

class _StoreProfileCoverState extends State<StoreProfileCover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CommercialCover(
            name: "Pet Center",
            image:
                "https://thevetservice.com/wp-content/uploads/2019/06/options-huge-vet-bill.jpg",
            rate: 5,
            title: "Pet Store",
            shortDescription: "Lorem Ipsum is simply dummy text",
          ),

          SizedBox(
            height: PetsTheme.getLargerPadMarg(),
          ),

          //friends & pets
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Pair(
                  Text("450",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Followers",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () => Navigator.pushNamed(context, 'friends'),
              ),
              GestureDetector(
                child: Pair(
                  Text("30",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Reviews",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Reviews");
                },
              ),
              GestureDetector(
                child: Pair(
                  Text("45",
                      style: TextStyle(
                          fontSize: PetsTheme.getLargeFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Photos",
                      style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white,
                      )),
                ),
                onTap: () {
                  print("Photos");
                },
              ),
            ],
          ),
          SizedBox(
            height: PetsTheme.getLargePadMarg(),
          ),
        ],
      ),
    );
  }
}

class CommercialCover extends StatelessWidget {
  CommercialCover(
      {this.name, this.image, this.rate, this.title, this.shortDescription});
  final String name;
  final String image;
  final double rate;
  final String title;
  final String shortDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //pp & data
        Row(
          children: [
            Container(
              height: PetsTheme.radius6 * 2,
              width: PetsTheme.radius6 * 2,
              child: UserAvatar(
                image: image,
                imageRatio: 1,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: TextStyle(
                          fontSize: PetsTheme.getLargerFont(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  PetMatchRating(
                      rate: rate,
                      size: PetsTheme.getMeduimFont(),
                      ratedColor: Colors.white,
                      unratedColor: Colors.white.withAlpha(50)),
                  SizedBox(
                    height: PetsTheme.getMeduimPadMarg(),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white),
                  ),
                  Text(
                    shortDescription,
                    style: TextStyle(
                        fontSize: PetsTheme.getMeduimFont(),
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),

        SizedBox(
          height: PetsTheme.getLargerPadMarg(),
        ),
        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton(
              child: FittedBox(
                  child: Text(
                "Send a message",
                style: TextStyle(
                    fontSize: PetsTheme.getSmallFont(),
                    color: PetsTheme.currentMainColor),
              )),
              color: Colors.white,
              height: 30,
              width:
                  MediaQuery.of(context).size.width / 3, // good for SmallFont
            ),
            RoundButton(
              child: FittedBox(
                  child: Text(
                "Following",
                style: TextStyle(
                    fontSize: PetsTheme.getSmallFont(), color: Colors.white),
              )),
              borderColor: Colors.white,
              height: 30,
              width:
                  MediaQuery.of(context).size.width / 3, // good for SmallFont
            ),
            CircularMoreButton(
              radius: 15,
              color: Colors.white,
              backgroundColor: Color.fromRGBO(20, 44, 122, 0.5),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
