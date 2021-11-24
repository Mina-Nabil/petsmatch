import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:petmatch/providers/api_providers/api_url.dart';

abstract class Post {
  Post({
    @required this.owner,
    @required this.postDate,
    @required this.commentsCount,
    @required this.sharesCount,
    @required this.lovesCount,
    @required isLoved,
  }) {
    _isLoved = isLoved;
  }

  bool get isLoved {
    return _isLoved;
  }

  void toggleLove() {
    if (_isLoved)
      unlove();
    else
      love();
  }

  void love() {
    _isLoved = true;
    lovesCount++;
  }

  void unlove() {
    _isLoved = false;
    lovesCount--;
  }

  final PostOwner owner;
  final DateTime postDate;
  final int commentsCount;
  final int sharesCount;
  int lovesCount;
  bool _isLoved;
}

class RegularPost extends Post {
  RegularPost({
    @required PostOwner owner,
    @required DateTime postDate,
    @required int commentsCount,
    @required int sharesCount,
    @required int lovesCount,
    @required bool isLoved,
    this.image,
    this.text,
  }) : super(
            owner: owner,
            lovesCount: lovesCount,
            commentsCount: commentsCount,
            sharesCount: sharesCount,
            isLoved: isLoved,
            postDate: postDate) {
    assert(image != null || text != null,
        "RegularPost should has image or text or both");
  }

  final String image;
  final String text;
  URLs _URLS = new URLs();

  // factory RegularPost.fromJson(Map<String, dynamic> parsedJson) {
  //   return new RegularPost(
  //     owner: parsedJson['owner'],
  //     postDate: parsedJson['postDate'],
  //     commentsCount: parsedJson['commentsCount'],
  //     sharesCount: parsedJson['sharesCount'],
  //     lovesCount: parsedJson['lovesCount'],
  //     isLoved: false,
  //   );
  // }
  factory RegularPost.fromJson(Map<String, dynamic> parsedJson) {
    String gender = "Female";
    print("${parsedJson['user']} this is the gender of the parsedJSON");
    if (parsedJson['user']['gender'] == 1) gender = "Male";
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String image = 'https://petsmatch-be.herokuapp.com' + parsedJson['image'];
    PostOwner po = new UserPostOwner(
      id: parsedJson['user']['id'],
      name: parsedJson['user']['name'],
    );
    print(parsedJson['image']);
    return new RegularPost(
      postDate: dateFormat.parse(parsedJson['created_at']),
      text: parsedJson['content'],
      image: image,
      owner: po,
      commentsCount: parsedJson['comments'].length,
      sharesCount: parsedJson['shares'].length,
      lovesCount: 0,
      isLoved: false,
    );
  }
}

abstract class PostOwner {
  PostOwner({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
  });
  /*
   * whoIAm method should return a string represent the role of the post owner (like: Owner of Rex, Mike's Pet)
   * Must be implemented by any class "Owner" that inherent from PostOwner
   */
  String whoIAm();

  final int id;
  final String name;
  final String imageUrl;
}

/*
 * In case of the post's owner is app user 
 */
class UserPostOwner extends PostOwner {
  UserPostOwner({
    @required int id,
    @required String name,
    @required String imageUrl,
    this.pets,
  }) : super(id: id, name: name, imageUrl: imageUrl);

  String whoIAm() {
    String role;
    if (pets != null) {
      role = "Owner of ";
      for (var pet in pets) {
        role += pet + ", ";
      }
    } else {
      role = "No pets yet";
    }

    return role.substring(
        0,
        role.length -
            2); /*substring to remove last 2 chars ", " , i know it is not the best way :P*/
  }

  final List<String> pets;
}

/*
 * In case of the post's owner is a pet owned by app user 
 */
class PetPostOwner extends PostOwner {
  PetPostOwner({
    @required int id,
    @required String name,
    @required String imageUrl,
    @required this.owner,
  }) : super(id: id, name: name, imageUrl: imageUrl);

  String whoIAm() {
    return "$owner's pet";
  }

  // TODO should be User object
  final String owner;
}

// temporary posts

List<RegularPost> posts = [
  RegularPost(
    owner: UserPostOwner(
        id: 1,
        name: "Ahmed Mahmoud",
        imageUrl:
            "https://www.leisureopportunities.co.uk/images/995586_746594.jpg",
        pets: ["Rex"]),
    commentsCount: 5,
    lovesCount: 2,
    sharesCount: 0,
    postDate: DateTime.now(),
    isLoved: false,
    text: "Any recommendations for good vets ?!",
  ),
  RegularPost(
    owner: UserPostOwner(
        id: 2,
        name: "Yasmine",
        imageUrl:
            "https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
        pets: ["Coco"]),
    commentsCount: 55,
    lovesCount: 1,
    sharesCount: 21,
    postDate: DateTime.now().subtract(new Duration(hours: 2)),
    isLoved: true,
    image:
        "https://i2-prod.mirror.co.uk/incoming/article8596219.ece/ALTERNATES/s615/1_Sad-dog.jpg",
    text: "Depressed, Please pray for him ...",
  ),
  RegularPost(
    owner: PetPostOwner(
        id: 3,
        name: "Bella",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ4rWwwpsA5Sy7u-DqhdkLC2xnBn27ojstXg&usqp=CAU",
        owner: "Ahmed Saeed"),
    commentsCount: 2,
    lovesCount: 14,
    sharesCount: 0,
    postDate: DateTime.now().subtract(new Duration(days: 1)),
    isLoved: true,
    image:
        "https://media-exp1.licdn.com/dms/image/C4E1BAQHBVr3Kwo3X9Q/company-background_10000/0/1595862607895?e=2159024400&v=beta&t=vMkTsEK9mEdru9PDp44XdQv5mDOP2PRjwJVkvtHQgys",
  ),
  RegularPost(
    owner: UserPostOwner(
        id: 3,
        name: "Emma",
        imageUrl: "https://images.unsplash.com/photo-1558898479-33c0057a5d12",
        pets: ["Leo"]),
    commentsCount: 37,
    lovesCount: 102,
    sharesCount: 0,
    postDate: DateTime.now().subtract(new Duration(days: 1)),
    isLoved: true,
    image:
        "https://images.theconversation.com/files/170370/original/file-20170522-7384-1ofzkae.jpg",
    text: "My Friend <3",
  ),
  RegularPost(
    owner: UserPostOwner(
        id: 3,
        name: "Sandy",
        imageUrl: "https://images.unsplash.com/photo-1558898479-33c0057a5d12",
        pets: ["picky"]),
    commentsCount: 17,
    lovesCount: 18,
    sharesCount: 3,
    postDate: DateTime.now().subtract(new Duration(days: 2)),
    isLoved: true,
    text: "Pets come with some powerful health benefits." +
        "Here’s how caring for an animal can help relieve depression and anxiety, lower stress levels, and even improve your heart health." +
        "Most pet owners are clear about the immediate joys that come with sharing their lives with companion animals. However, many of us remain unaware of the physical and mental health benefits that can also accompany the pleasure of snuggling up to a furry friend. It’s only recently that studies have begun to scientifically explore the benefits of the human-animal bond.",
  ),
];
