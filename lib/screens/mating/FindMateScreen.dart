import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/providers/api_providers/pet_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/screens/mating/FindMateCard.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';
import 'package:provider/provider.dart';

class FindMateScreen extends StatefulWidget {
  @override
  State<FindMateScreen> createState() => _FindMateScreenState();
}

class _FindMateScreenState extends State<FindMateScreen> {
  List<Pet> pets;

  Pet selectedPet;

  UserProvider userProvider;
  PetProvider petProvider;

  Widget petsWidgets;

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
    pets = await petProvider.showOtherPets(token: userProvider.user.token);

    print('${status} these are the status');
    if (pets != []) {
      setState(() {
        done = true;
        if (done)
          petsWidgets = PageView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return FindMatingCard(pets[index]);
              });

        print("${done} it is");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(
              petProvider.selectedPet.image,
            ).image,
            radius: PetsTheme.radius1,
          ),
          SizedBox(
            width: PetsTheme.getSmallPadMarg(),
          ),
          Text("${petProvider.selectedPet.name} is looking for a Mate",
              style: TextStyle(
                  fontSize: PetsTheme.getLargeFont(),
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ],
      ),
      //body: FindMatingCard(pets[0]),
      body: petsWidgets,
    );
  }
}
