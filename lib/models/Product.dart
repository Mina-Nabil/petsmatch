import 'package:petmatch/models/Profile.dart';

class Product {
  String name;
  String desc;
  String imageURL;
  double price;
  Profile productOwner;

  Product(this.name, this.desc, this.price, this.imageURL, this.productOwner);
}