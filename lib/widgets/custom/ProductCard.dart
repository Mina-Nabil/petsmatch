import 'package:flutter/material.dart';
import 'package:petmatch/models/Product.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/custom/PetMatchRating.dart';

class ProductCard extends StatelessWidget {
  Product _product;

  ProductCard(this._product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      padding: EdgeInsets.all(PetsTheme.getLargePadMarg()),
   
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container( 
            height: 120,
            width: 100,
            padding: EdgeInsets.all(PetsTheme.getSmallestPadMarg()),
            margin: EdgeInsets.only(bottom: PetsTheme.getMeduimPadMarg()),
            decoration: BoxDecoration(border:  
            Border.all(color: PetsTheme.petsGrayIconColor.withOpacity(0.1)),
          ),
          child: Image.network(_product.imageURL),
          ),
          FittedBox(child: Text(_product.name, style: TextStyle(color: PetsTheme.blackTextColor),)),
          FittedBox(child: Text(_product.name, style: TextStyle(color: PetsTheme.petsHintGrayColor))),
          FittedBox(child: Text(_product.productOwner.name, style: TextStyle(color: PetsTheme.petsBlueColor, fontWeight: FontWeight.bold))),
          FittedBox(child: Text(_product.price.toString(), style: TextStyle(color: PetsTheme.petsGreenColor, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
