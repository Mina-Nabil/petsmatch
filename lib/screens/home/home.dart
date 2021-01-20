import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/feed/FeedHeader.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';
import 'package:petmatch/widgets/feed/SuggestionsIconsList.dart';
import 'package:petmatch/widgets/screens/CommonScreenSetup.dart';
import 'package:petmatch/widgets/buttons/PetsButton.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  User testUser;
  List<Profile> suggests;
  List<Pet> pets;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    testUser =  User("Mina !","https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw", "hamada@pets" );
    pets = [
    Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg"),
    Pet("Bobby", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg"),
    Pet("Bobby", "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
    Pet("Bobby", "https://www.cesarsway.com/wp-content/uploads/2019/10/AdobeStock_190562703.jpeg"),
    Pet("Bobby", "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg"),
    Pet("Bobby", "https://i.insider.com/5efe3d7faee6a8324a656478?width=1100&format=jpeg&auto=webp"),
    Pet("Bobby", "https://scx2.b-cdn.net/gfx/news/hires/2018/2-dog.jpg"),
    Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg"),
    ];
  testUser.addAllPet(pets);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      FeedHeader(testUser),
      ListView(children: [
        NewPostWidget(),
        SuggesionsIconsList([SuggestedIcon(testUser),  
          ...pets.map((element) {return SuggestedIcon(element);})
        ]),

        
      ],),
      isNavBar: true,
      isSmallTop: false,
      isTitle: false,
    );
  }
}
