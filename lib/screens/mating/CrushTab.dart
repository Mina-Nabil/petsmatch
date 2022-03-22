import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petmatch/models/Crush.dart';
import 'package:petmatch/models/Pet.dart';
import 'package:petmatch/providers/api_providers/crush_provider.dart';
import 'package:petmatch/providers/api_providers/mate_provider.dart';
import 'package:petmatch/providers/api_providers/user_provider.dart';

import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/buttons/CircularMoreButton.dart';
import 'package:petmatch/widgets/main/UserAvatar.dart';
import 'package:provider/provider.dart';

class CrushTab extends StatefulWidget {
  @override
  State<CrushTab> createState() => _CrushTabState();
}

class _CrushTabState extends State<CrushTab> {
  CrushProvider crushProvider;
  UserProvider userProvider;
  MateProvider mateProvider;
  bool isLoading = true;
  List<Crush> crushes;
  List<Widget> matingTileWidget = [];
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);

    crushProvider = Provider.of<CrushProvider>(context, listen: false);

    mateProvider = Provider.of<MateProvider>(context, listen: false);
    print(mateProvider);
    Future.delayed(Duration.zero).then((value) => updateCrushes());

    super.initState();
  }

  void mate(Pet from, Pet to) async {
    print(from);
    int status = await mateProvider.createmate(to, from, context);
    if (status >= 200 && status < 300) {}
  }

  void updateCrushes() async {
    int status =
        await crushProvider.getCrushes(userProvider.user.token, context);
    if (status >= 200 && status < 300) {
      setState(() {
        isLoading = false;
        crushes = crushProvider.crushes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Center(child: CircularProgressIndicator())
        : ListView(
            children: //matingTileWidget,
                crushes != []
                    ? crushes.map((e) {
                        return MatingTile(
                          image1: e.crush_on.image,
                          petName1: e.crush_on.name,
                          image2: e.crush_from.image,
                          petName2: e.crush_from.name,
                          trailing: CircularButton(
                            child: SvgPicture.asset(
                              "assets/images/icons/setupDate.svg",
                              color: PetsTheme.currentMainColor,
                            ),
                            backgroundColor:
                                PetsTheme.currentMainColor.withOpacity(0.2),
                            onPressed: () {
                              Future.delayed(Duration.zero).then(
                                  (value) => mate(e.crush_from, e.crush_on));
                            },
                            radius: PetsTheme.radius2,
                          ),
                        );
                      }).toList()
                    : Column());
  }
}

class MatingTile extends StatelessWidget {
  MatingTile({
    this.image1,
    this.petName1,
    this.image2,
    this.petName2,
    this.trailing,
  });
  final String image1;
  final String image2;
  final String petName1;
  final String petName2;
  final Widget trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CoupleAvatar(
          image1: image1,
          image2: image2,
        ),
        title: Text("$petName1 Likes $petName2"),
        subtitle: Text("2 days ago"),
        trailing: trailing);
  }
}

class CoupleAvatar extends StatelessWidget {
  CoupleAvatar({this.image1, this.image2});
  final String image1;
  final String image2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: PetsTheme.radius1 * 2,
          height: PetsTheme.radius1 * 2,
          child: UserAvatar(
            image: image1,
            imageRatio: 1,
          ),
        ),
        SizedBox(
          width: PetsTheme.getSmallPadMarg(),
        ),
        SvgPicture.asset(
          "assets/images/icons/heart.svg",
          color: Colors.pink,
          height: 12,
        ),
        SizedBox(
          width: PetsTheme.getSmallPadMarg(),
        ),
        CircleAvatar(
          backgroundImage: Image.network(image2).image,
          radius: PetsTheme.radius1,
        ),
      ],
    );
  }
}
