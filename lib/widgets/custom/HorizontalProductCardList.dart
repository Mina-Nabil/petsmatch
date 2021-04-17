import 'package:flutter/material.dart';
import 'package:petmatch/models/Product.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/ProductCard.dart';

class HorizontalProductCardList extends StatelessWidget {
  HorizontalProductCardList(
    this.title,
    this.products,
  );
  final List<Product> products;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: PetsTheme.getLargePadMarg(), bottom: PetsTheme.getLargePadMarg(), left: PetsTheme.getLargestPadMarg()),
        margin: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(PetsTheme.radius2))),
        height: 280 + PetsTheme.getLargerPadMarg() * 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 20,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: FittedBox(
                child: Text(
                  this.title,
                  style: TextStyle(color: PetsTheme.blackTextColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...products.map((product) => Padding(
                        padding: EdgeInsets.only(bottom: PetsTheme.getLargestPadMarg(), right: PetsTheme.getMeduimPadMarg()),
                        child: ProductCard(product),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
