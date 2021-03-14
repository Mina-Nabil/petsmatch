import 'package:flutter/material.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/screens/PetMatchSingleScreen.dart';


class PhotosScreen extends StatelessWidget {

  List<String> photos = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNqJBAsZBHxnG0WK7r0wtbG9ioGCjxrFu0Bw&usqp=CAU",
    "https://i0.wp.com/factcheckni.org/wp-content/uploads/2020/04/FactCheckNI-20200409-Pets-COVID-19.jpg?fit=1200%2C800&ssl=1",
    "https://img.etimg.com/thumb/msid-75599221,width-650,imgsize-189110,,resizemode-4,quality-100/istock-1216130118.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_LlUtxzfoR_L28kTjGXmSAlkFTgYJZVFFdw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHSegapbQR_FFPBqLko1uDSzx6F7yRykLahQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ1uQPaUjp1h8X6yhGXXJ-b1jzHVwC9gHBkA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXm8hFyXu3pmj_Rlhibo8ophyTdNmwWutHSg&usqp=CAU",
    "https://www.cdc.gov/healthypets/images/slider/dog-and-cat.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFRNMZVZFPmfLEqBVkDQX92i1eIqbs4P9_mA&usqp=CAU",
    "https://www.petmd.com/sites/default/files/styles/home_page_banner_desktop/public/2020-10/sad-mixed-breed-dog-picture-dog-skin-condition-desktop.jpg?itok=9b6dqqA1",
    "https://imgix.bustle.com/uploads/image/2019/8/21/e2a45200-e0ce-49f4-92da-5e15eb7b42d1-screen-shot-2019-08-21-at-50241-pm.png?w=1200&h=630&fit=crop&crop=faces&fm=jpg",
    "https://i.redd.it/z225ykamk3e31.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRREkLjFfOeV6aRT6GTdvuPTyTIfuUBTX3_ow&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController( );
    return PetMatchSingleScreen(
      backArrow: true,
      title: Text("Ahmed Abdallah",style: TextStyle(fontFamily: "Roboto", fontSize: PetsTheme.getMuchLargerFont(), color: PetsTheme.whiteBarColor, fontWeight: FontWeight.bold)),
      bodyBackgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text("Photos", style: TextStyle(fontSize: PetsTheme.getLargeFont(), fontWeight: FontWeight.bold, color: PetsTheme.currentMainColor),)),
          
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(left: 20, right: 20,),
              itemCount: photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5 
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    photos[index],
                    fit: BoxFit.cover,
                  ),
                );
                },
            )
          )
        ],
      )
    );
  }
}