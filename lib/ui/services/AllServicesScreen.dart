import 'package:flutter/material.dart';
import 'package:petmatch/models/PetsBanner.dart';
import 'package:petmatch/models/Vet.dart';
import 'package:petmatch/ui/services/widgets/HorizontalBannerList.dart';
import 'package:petmatch/widgets/feed/SuggestedIcon.dart';
import 'package:petmatch/widgets/feed/SuggestionsIconsList.dart';

class AllServicesScreen extends StatefulWidget {
  @override
  _AllServicesScreenState createState() => _AllServicesScreenState();
}

class _AllServicesScreenState extends State<AllServicesScreen> {
  List<PetsBanner> _bannerList = [
    PetsBanner(imageURL: "https://i.pinimg.com/originals/03/ff/df/03ffdf9f9c46b287461de84648e3efdb.jpg"),
    PetsBanner(imageURL: "https://qph.fs.quoracdn.net/main-thumb-507505710-200-ginheafhxlrcnlxryuhteomqoggpcssg.jpeg")
  ];

  List<Vet> _suggestedVetsList = [
    Vet("PetsPlus", "https://media.istockphoto.com/photos/vet-with-dog-and-cat-puppy-and-kitten-at-doctor-picture-id1171733307?k=6&m=1171733307&s=612x612&w=0&h=PYNAOnrabj2VDp7QJAGKkdMZ4i7ZvbEhH0kTcasuw1Q="),
    Vet("Vet Point", "https://www.credibly.com/wp-content/uploads/2015/03/vet-loans-1030x760.jpg"),
    Vet("Vet Buddy", "https://now.tufts.edu/sites/default/files/190515_cindy_vet_lg.jpg"),
    Vet("Pet Baba", "https://www.heel.com/media/images/heel_de/heel_de_vet_arzneimittel/heelvet_image_w918.jpg"),
    Vet("Vetinary", "https://www.usnews.com/dims4/USNEWS/1afb8f1/2147483647/crop/2000x1313%2B0%2B0/resize/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2F75%2F77%2F28b9c03949ceb1e855bfa2b78c46%2F200109-veterinarian-stock.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          HorizontalBannerList(_bannerList),
          SuggesionsIconsList( 
            [..._suggestedVetsList.map((e) => SuggestedIcon(e))], 
            listHeight: 120,
          )
        ],
      ),
    );
  }
}

