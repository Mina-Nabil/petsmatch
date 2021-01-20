import 'package:petmatch/models/Comment.dart';
import 'package:petmatch/models/Post.dart';
import 'package:petmatch/models/User.dart';

class ImagePost extends Post {

  String imageURL;

  ImagePost(owner, this.imageURL, {List<Comment> comments=const [], List<User> lovers, List<Post> shares, DateTime date,  }){
    super.owner = owner;
  }

}