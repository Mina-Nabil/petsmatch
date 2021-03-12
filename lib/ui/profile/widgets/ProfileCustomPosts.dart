import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/ui/profile/widgets/AboutPost.dart';


abstract class ProfileCustomPost extends StatelessWidget {
  factory ProfileCustomPost () {
    if(PetsTheme.accountType == AccountType.vet || PetsTheme.accountType == AccountType.store) {
      return AboutPost(
        phoneNo: "012124578", 
        address: "185 Anwar el mofty", 
        website: "www.vetpoint.com", 
        mail: "vetpoint@vetpoint.com", 
        workingHours: "10:00 am - 10:00 pm",
      );
    } else {
      return ProfileCustomPostEmpty();
    }
  }
}

class ProfileCustomPostEmpty extends StatelessWidget implements ProfileCustomPost {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
}