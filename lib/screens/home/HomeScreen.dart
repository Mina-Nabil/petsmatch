import 'package:flutter/material.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/Profile.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularButton.dart';
import 'package:petmatch/widgets/feed/NewPostWidget.dart';
import 'package:petmatch/widgets/feed/RegularPostWidget.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';
import 'package:petmatch/widgets/feed/SuggestionsIconsList.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:petmatch/widgets/screens/PetMatchContainer.dart';


class HomeScreen2 extends StatefulWidget {

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {

final String searchIconPath = "assets/images/icons/main/search.svg";

  User mainUser;
  List<Profile> suggests;
  List<Pet> pets;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainUser =  User("Mina !","https://lh3.googleusercontent.com/9AY45-uFNsXWwvtQmZFRWrpy1koWGBLs5XDVYjy3xg-G6fjlekANnsSbhYYU-E0CDw", "hamada@pets" );
    pets = [
    Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg", "Mina"),
    Pet("Bobby", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg", "Mina"),
    Pet("Bobby", "https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg", "Mina"),
    Pet("Bobby", "https://www.cesarsway.com/wp-content/uploads/2019/10/AdobeStock_190562703.jpeg", "Mina"),
    Pet("Bobby", "https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", "Mina"),
    Pet("Bobby", "https://i.insider.com/5efe3d7faee6a8324a656478?width=1100&format=jpeg&auto=webp", "Mina"),
    Pet("Bobby", "https://scx2.b-cdn.net/gfx/news/hires/2018/2-dog.jpg", "Mina"),
    Pet("Bobby", "https://cdn.pixabay.com/photo/2017/09/25/13/12/dog-2785074__340.jpg","Mina"),
    ];
  mainUser.addAllPet(pets);
  }
 // later PostProvider
  List<Post> testPosts = posts; 
  @override
  Widget build(BuildContext context) {
    List<Widget> petImages = [];
    if (mainUser.pets.length > 0) {
      mainUser.pets.forEach((element) {
        petImages.add(
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: PetsTheme.getLargePadMarg()), 
            child: UserAvatar(image: element.image, imageRatio: 1)
          ));
      });
    }

    return PetMatchContainer(

      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:[
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[ 
              Container(
                width: 45,
                height: 45,
                child: UserAvatar(image: mainUser.image, imageRatio: 1)
              ),
              Container(
                  height: 55,
                  width: 55,
                  child: GestureDetector(
                    child: CircularPetButton(PetsTheme.currentMainColor.withOpacity(.2), searchIconPath, Colors.white),
                    onTap: () => Navigator.of(context).pushNamed('/search'),
                  ),
              )
            ]
          ),

       /* Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text("Welcome back \nMina!",
                style: TextStyle(
                  fontFamily: "Roboto", 
                  fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 55,
                width: 55,
                child: GestureDetector(
                  child: CircularPetButton(PetsTheme.currentMainColor.withOpacity(.2), searchIconPath, Colors.white),
                  onTap: () => Navigator.of(context).pushNamed('/search'),
                ),
              )
            ]
            
          ),
        ),
*/
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              //children: petImages,
              child: Row(
                children: petImages,
              ),
            ),
          )
        ]
      ),

      bodyPadding: EdgeInsets.zero,
      body: ListView(
        children: [
          NewPostWidget(),
          SuggesionsIconsList([SuggestedIcon(mainUser),  
            ...pets.map((element) {return SuggestedIcon(element);})
          ]),

          ...testPosts.map(
            (post) {
              return RegularPostWidget(
                post,
                margin: EdgeInsets.symmetric(vertical: PetsTheme.getMeduimPadMarg()),
                contentPadding: EdgeInsets.symmetric(horizontal: PetsTheme.getMuchLargerPadMarg()),
              );
            }
          ).toList(),
        ],
      ),
    );
  }
}