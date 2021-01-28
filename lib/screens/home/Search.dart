import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petmatch/widgets/screens/basescreen.dart';
import 'package:petmatch/theme/petsTheme.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      // isNavBar: true,
        isRightPadding: false,
        isLeftPadding: false,
        isBottomPadding: false,
        //isTopPadding: false,
        noTitle: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: PetsTheme.getMuchLargerPadMarg(), vertical: PetsTheme.getMeduimPadMarg()),
                child: FittedBox(
                  child: Text(
                    "What are you looking for?",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: PetsTheme.whiteBarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: PetsTheme.getLargeFont()),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: PetsTheme.getMuchLargerPadMarg(), vertical: PetsTheme.getMeduimPadMarg()),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(PetsTheme.getSmallPadMarg()),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide( width: 0,style: BorderStyle.none,),
                              ),
                              prefixIcon: Icon(Icons.search,),
                              hintText: "Search PetsMatch",
                              hintStyle: TextStyle(fontSize: PetsTheme.getMeduimFont()),
                            ),
                          ),
                      ),

                      SizedBox(width: PetsTheme.getLargePadMarg(),),

                      FittedBox(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: PetsTheme.whiteBarColor,
                              fontWeight: FontWeight.normal,
                              fontSize: PetsTheme.getLargeFont()),
                        ),
                      ),
                    
                    
                    ],
                  )),
                  
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: PetsTheme.getMeduimPadMarg()),
                      decoration: BoxDecoration(
                          color: PetsTheme.whiteBarColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
            ],
          ),
        ));
  }
}
