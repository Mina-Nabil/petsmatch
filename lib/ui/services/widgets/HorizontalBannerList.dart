
import 'package:flutter/material.dart';
import 'package:petmatch/models/PetsBanner.dart';
import 'package:petmatch/theme/petsTheme.dart';

class HorizontalBannerList extends StatelessWidget {

  final double pageFraction = 0.8;

  HorizontalBannerList(
    this.bannerList,
  );
  final List<PetsBanner> bannerList;

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: MediaQuery.of(context).size.width * bannerList.length,
            padding: EdgeInsets.symmetric(vertical: PetsTheme.getLargerPadMarg()),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(PetsTheme.radius2), bottomRight: Radius.circular(PetsTheme.radius2))),
            height: 240,
            child: PageView(
      controller: new PageController(viewportFraction: pageFraction),
      children: [
        ...bannerList.map(
          (banner) => Padding(
            padding: EdgeInsets.only(bottom: PetsTheme.getLargestPadMarg(), right: PetsTheme.getMeduimPadMarg()),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(PetsTheme.radius1)),
                child: Image.network(
                  banner.imageURL,
                  fit: BoxFit.fill,
                )),
          ),
        )
      ],
    ));
  }
}