import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/models/PetsBanner.dart';
import 'package:petmatch/models/Product.dart';
import 'package:petmatch/models/User.dart';
import 'package:petmatch/models/Vet.dart';
import 'package:petmatch/providers/api_providers/search_provider.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/HorizontalBannerList.dart';
import 'package:petmatch/widgets/custom/HorizontalProductCardList.dart';
import 'package:petmatch/widgets/custom/HorizontalUserCardList.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';
import 'package:petmatch/widgets/feed/SuggestionsIconsList.dart';
import 'package:provider/provider.dart';

class AllServicesScreen extends StatefulWidget {
  @override
  _AllServicesScreenState createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  SearchProvider searchProvider;
  bool isPetsLoading = true;
  bool isSuggestedLoading = true;
  bool isNearbyLoading = true;
  Widget suggesionsIconsListWidget;
  Widget vetsIconsListWidget;
  void initState() {
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Future.delayed(Duration.zero).then((value) => findTrainers());
    Future.delayed(Duration.zero).then((value) => findVets());
    super.initState();
  }

  void findTrainers() async {
    List<User> trainers = await searchProvider.searchSpecific("Trainer");
    setState(() {
      suggesionsIconsListWidget = SuggesionsIconsList(
        [...trainers.map((e) => SuggestedIcon(e))],
        listHeight: 120,
      );
      if (trainers.isEmpty)
        suggesionsIconsListWidget = Text("No Vets Nearby Yet!",
            style: TextStyle(
                fontSize: PetsTheme.getMeduimFont(),
                color: PetsTheme.currentMainColor));
      isSuggestedLoading = false;
    });
  }

  void findVets() async {
    List<User> vets = await searchProvider.searchSpecific("Vet");
    print(vets);
    setState(() {
      vetsIconsListWidget = HorizontalUserCardList(
          "Vets Nearby", [...vets.map((e) => Vet(e.name, e.image, 5))]);
      if (vets.isEmpty)
        vetsIconsListWidget = Text("No Vets Nearby Yet!",
            style: TextStyle(
                fontSize: PetsTheme.getMeduimFont(),
                color: PetsTheme.currentMainColor));
      isNearbyLoading = false;
    });
  }

  List<Product> _productsList = [
    Product(
        "Detol",
        "Best Dog Cleaner",
        60.5,
        "https://cdn0.woolworths.media/content/wowproductimages/large/069455.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
    Product(
        "Pedigree",
        "Best Dog Food",
        130.5,
        "https://lenews.ch/wp-content/uploads/2021/02/Pedigree-Adult.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
    Product(
        "Detol",
        "Best Dog Cleaner",
        60.5,
        "https://cdn0.woolworths.media/content/wowproductimages/large/069455.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
    Product(
        "Pedigree",
        "Best Dog Food",
        130.5,
        "https://lenews.ch/wp-content/uploads/2021/02/Pedigree-Adult.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
    Product(
        "Detol",
        "Best Dog Cleaner",
        60.5,
        "https://cdn0.woolworths.media/content/wowproductimages/large/069455.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
    Product(
        "Pedigree",
        "Best Dog Food",
        130.5,
        "https://lenews.ch/wp-content/uploads/2021/02/Pedigree-Adult.jpg",
        Vet(
            "Vet Point",
            "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg",
            4.5)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          isSuggestedLoading
              ? Center(child: CircularProgressIndicator())
              : suggesionsIconsListWidget,
          isNearbyLoading
              ? Center(child: CircularProgressIndicator())
              : vetsIconsListWidget,
          HorizontalProductCardList("Featured Products", _productsList),
        ],
      ),
    );
  }
}
