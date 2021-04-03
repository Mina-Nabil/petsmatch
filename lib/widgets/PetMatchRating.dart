import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class PetMatchRating extends StatelessWidget {

  PetMatchRating({
    @required this.rate,
    @required this.size,
    @required this.ratedColor,
    @required this.unratedColor,
  });

  final double rate;
  final double size;
  final Color ratedColor;
  final Color unratedColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemSize: size,
          itemBuilder: (context, _) => Icon(Icons.star, color: ratedColor,),
          initialRating: rate,
          direction: Axis.horizontal,
          unratedColor: unratedColor,
          allowHalfRating: true,
          onRatingUpdate: null
        ),
        Text("| $rate", style: TextStyle(fontSize: size, color: ratedColor),),
      ],
    );
  }
}