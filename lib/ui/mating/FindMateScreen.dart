import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/Pair.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class FindMateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PetMatchSingleScreen(
      backArrow: true,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.network("https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=1600&h=900",).image,
            radius: PetsTheme.radius1,
          ),
          SizedBox(width: PetsTheme.getSmallPadMarg(),),
          Text("Bella is looking for a Mate",
            style: TextStyle(
              fontSize: PetsTheme.getLargeFont(),
              color: Colors.white,
              fontWeight: FontWeight.bold))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.network("https://images.indianexpress.com/2021/01/Golden-Retriever-dog.jpg", fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(20),
              )
            ),
            SizedBox(height: PetsTheme.getMeduimPadMarg(),),
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                            Text("Coco", style: TextStyle(fontSize: PetsTheme.getLargerFont(), fontWeight: FontWeight.bold, color: PetsTheme.blackTextColor),),
                            Text("20 Miles away", style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color: Colors.grey[600],)),
                            ]
                          ),
                          CircularButton(
                            child: SvgPicture.asset('assets/images/icons/mating/matingLove.svg'),
                            radius: PetsTheme.radius3,
                            backgroundColor: Colors.red[50], 
                            onPressed: null
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: PetsTheme.getSmallPadMarg()),
                      child: Text("View profile", style: TextStyle(fontSize: PetsTheme.getMeduimFont(), color:PetsTheme.currentMainColor, fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2, 
                          child: Container(
                            margin: EdgeInsets.only(right: PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                              color: PetsTheme.commentBgColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: PetsTheme.radius2,
                                    backgroundImage: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6zes53m4a_2VLTcmTn_bHk8NO5SkuWfcQbg&usqp=CAU").image,
                                  ),
                                  SizedBox(width: PetsTheme.getSmallPadMarg(),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(child: Text("Owner", style: TextStyle(color: PetsTheme.currentMainColor),)),
                                      FittedBox(child: Text("Ahmed Mostafa")),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ),
                        Flexible(
                          flex: 1, 
                          child: Container(
                            margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                              color: PetsTheme.commentBgColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Pair(
                                FittedBox(child: Text("Breed",  style: TextStyle(color: PetsTheme.currentMainColor),)),
                                FittedBox(child: Text("Golden")),
                              ),
                            ),
                          )
                        ),
                        Flexible(
                          flex: 1, 
                          child: Container(
                            margin: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                            decoration: BoxDecoration(
                              color: PetsTheme.commentBgColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Pair(
                                FittedBox(child: Text("Age", style: TextStyle(color: PetsTheme.currentMainColor),)),
                                FittedBox(child: Text("6 months")),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/icons/paw.svg", color: PetsTheme.currentMainColor, width: 16,),
                        SizedBox(width: PetsTheme.getSmallestPadMarg(),),
                        RatingBar.builder(itemSize: PetsTheme.getSmallFont(),
                          itemBuilder: (context, _) => Icon(Icons.star, color: PetsTheme.currentMainColor,),
                          initialRating: 4.0,
                          direction: Axis.horizontal,
                          unratedColor: Colors.grey,
                          allowHalfRating: true,
                          onRatingUpdate: null
                        ),
                        Text("| 4.0", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: Colors.grey),),

                        SizedBox(width: PetsTheme.getLargePadMarg(),),

                        
                        Icon(Icons.person, size: 20, color: PetsTheme.currentMainColor,),
                        RatingBar.builder(itemSize: PetsTheme.getSmallFont(),
                          itemBuilder: (context, _) => Icon(Icons.star, color: PetsTheme.currentMainColor,),
                          initialRating: 3.0,
                          direction: Axis.horizontal,
                          unratedColor: Colors.grey,
                          allowHalfRating: true,
                          onRatingUpdate: null
                        ),
                        Text("| 3.0", style: TextStyle(fontSize: PetsTheme.getSmallFont(), color: Colors.grey),),

                        Expanded(child: Container()),
                        //reviews
                        GestureDetector(
                          child: Text("40 Reviews", style: TextStyle(color: PetsTheme.currentMainColor),),
                        )
                      ],
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}