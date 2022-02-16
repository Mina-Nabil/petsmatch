import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/Pair.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class SelectPetScreen extends StatefulWidget {
  @override
  State<SelectPetScreen> createState() => _SelectPetScreenState();
}

class _SelectPetScreenState extends State<SelectPetScreen> {
  List<Pet> pets;
  Pet selectedPet;

  UserProvider userProvider;
  PetProvider petProvider;

  List<Widget> petsWidgets = [];

  int status = 200;

  bool done = false;

  User mainUser;

  void initState() {
    Future.delayed(Duration.zero).then((value) => updatePets());
    super.initState();
  }

  void updatePets() async {
    /* whatever */

    userProvider = Provider.of<UserProvider>(context, listen: false);
    petProvider = Provider.of<PetProvider>(context, listen: false);
    print(userProvider.user.token);
    status = await petProvider.showMyPets(token: userProvider.user.token);

    print('${status} these are the status');
    if (status == 200) {
      pets = petProvider.pets;

      setState(() {
        done = true;
        if (done)
          petsWidgets = [
            for (var pet in pets)
              GestureDetector(
                  child: Pair(
                    CircleAvatar(
                      backgroundImage: Image.network(pet.image).image,
                      radius: PetsTheme.radius3,
                    ),
                    Text(
                      pet.name,
                      style: TextStyle(
                          fontSize: PetsTheme.getMeduimFont(),
                          color: PetsTheme.blackTextColor),
                    ),
                    space: PetsTheme.getSmallPadMarg(),
                  ),
                  onTap: () {
                    petProvider.setSelectedPet(pet);
                    selectedPet = pet;
                    Navigator.pushNamed(context, 'Mating/FindMateStart');
                  })
          ];
        print("${done} it is");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backgroundMask: bgMask.mating,
      backArrow: true,
      header: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Text("Who is looking for a Mate?",
            style: TextStyle(
                fontSize: PetsTheme.getEvenMuchLargerFont(),
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      bodyBackgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: PetsTheme.getMeduimPadMarg(),
            top: PetsTheme.getMuchLargerPadMarg(),
            right: PetsTheme.getMeduimPadMarg()),
        child: Wrap(
            spacing: PetsTheme.getLargestPadMarg(),
            runSpacing: PetsTheme.getLargestPadMarg(),
            alignment: WrapAlignment.center,
            children: petsWidgets),
      ),
    );
  }
}
