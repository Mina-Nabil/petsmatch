/*
 * Parent class for anyone can have profile "User, Pet, ...etc"
 */
abstract class Profile {
  int id;
  String name;
  String image;
  double rating;

  /*
  * whoIAm method should return a string represent the role of this profile owner (like: Owner of Rex, Mike's Pet)
  * Must be implemented by any class that inherent from Profile
  */
  String whoIAm();
}
