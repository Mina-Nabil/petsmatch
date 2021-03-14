import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/Pair.dart';


class AboutPost extends StatelessWidget {

  AboutPost({this.phoneNo, this.address, this.website, this.mail, this.workingHours});
  final String phoneNo;
  final String address;
  final String website;
  final String mail;
  final String workingHours;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: PetsTheme.getSmallFont(), color: PetsTheme.blackTextColor);
    SizedBox spacer = SizedBox(height: PetsTheme.getSmallPadMarg(),);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Pair(
            Icon(Icons.call, color: PetsTheme.currentMainColor, size: 16,), 
            Text(phoneNo, style: style,),
            direction: Axis.horizontal,
            space: PetsTheme.getMeduimPadMarg(),
          ),

          spacer,

          Pair(
            Icon(Icons.location_on, color: PetsTheme.currentMainColor,size: 16,), 
            Text(address,  style: style,), 
            direction: Axis.horizontal, space: PetsTheme.getMeduimPadMarg(),
          ),

          spacer,

          Pair(
            Icon(Icons.web, color: PetsTheme.currentMainColor,size: 16,), 
            Text(website, style: style,), 
            direction: Axis.horizontal,space: PetsTheme.getMeduimPadMarg(),
          ),

          spacer,

          Pair(
            Icon(Icons.email, color: PetsTheme.currentMainColor,size: 16,), 
            Text(mail, style: style,), 
            direction: Axis.horizontal,
            space: PetsTheme.getMeduimPadMarg(),
          ),
          
          spacer,

          Pair(
            Icon(Icons.access_time, color: PetsTheme.currentMainColor,size: 16,), 
            Text(workingHours, style: style,), 
            direction: Axis.horizontal,space: PetsTheme.getMeduimPadMarg(),
          ),

          spacer,

          Align(
            alignment: Alignment.centerRight,
            child: Text("See more", style: TextStyle(color: PetsTheme.currentMainColor),))
        ],
      ),
    );
  }
}