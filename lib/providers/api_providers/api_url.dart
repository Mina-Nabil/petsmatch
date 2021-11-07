class URLs {
  static final String host = "https://petsmatch-be.herokuapp.com/api";
  String login;
  String register;
  String createPet;
  String showMyPets;
  String showOtherPets;
  String getAPet;
  String createPost;
  String getAPost;
  String getNewsFeed;
  String getYourPosts;
  String createComment;
  String getPostComments;
  String getAComment;
  String updateUserData; // ?uid=30
  String crush; // ?uid=30
  String family; // ?uid=30
  String mate; // ?uid=30
  static final String getUserAlbums =
      "$host/api/return/user/portfolio"; // ?uid=53
  static final String addAlbum = "$host/api/handle/new/portfolio"; // post
  static final String deleteAlbum =
      "$host/api/handle/delete/portfolio"; // ?nid=503
  // follow or un-follow user can use for both
  static final String followUser =
      "$host/api/handle/user/follow"; // ?uid=1&fid=69
  static final String getFavoriteUsers =
      "$host/api/handle/return/all/favorite/users"; // ?uid=30&type=provider&page=1
  static final String editComment = "$host/api/handle/edit/comment"; // post
  static final String editProfileImage =
      "$host/handle/users/update/image"; // post
  static final String getCustomerPendingOrHistoryQuotes =
      "$host/api/return/end/user/pending/quotations"; // uid=36&status=1&page=0
  static final String getJobberReviews =
      "$host/api/return/user/rates"; // ?uid=69&page=0
  static final String changeQuotationState =
      "$host/handle/edit/quotation"; // nid=545&status=1
  static final String rateJobber =
      "$host/api/handle/new/rate"; // ?uid=36&title=rate&rated_uid=30&value=5&desc=some long description20
  static final String getJobberRate =
      "$host/api/return/user/rates/averages"; // ?uid=30
  static final String getUser = "$host/api/me"; // ?uid=30
  static final String getUserNotifications =
      "$host/api/return/user/notifications"; // ?uid=30&page=0
  static final String editUserNotifications =
      "$host/api/update/user/notifications"; // ?uid=30&id=30
  static final String getUserRecentNotifications =
      "$host/api/return/recent/user/notifications"; // ?uid=30
  static final String getQuote =
      "$host/api/return/quote/data"; // ?uid=37&id=573
  URLs() {
    showOtherPets = "$host/show/pets";
    crush = "$host/crush";
    family = "$host/family";
    family = "$host/mate";
    login = "$host/login";
    //login = "$host/my-api/login-user.json";
    register = "$host/register";
    createPet =
        "$host/api/pet"; // ?uid=53&title=22&lat=11&postal_code=33&working_hour=22&lng=3
    getAPet =
        "$host/api/pet"; // ?nid=440&title=333&working_hour=33&postal_code=22&lat=2&lng=5
    createPost = "$host/api/post"; // ?uid=53
    getAPost = "$host/api/post"; // ?uid=53
    getYourPosts = "$host/api/post"; // ?uid=53
    getNewsFeed = "$host/api/news-feed"; // ?uid=53
    createComment = "$host/api/comment"; // ?uid=53
    getPostComments = "$host/api/comment"; // ?uid=53
    getAComment = "$host/api/news-feed"; // ?uid=53
    updateUserData = "$host/api/me"; // ?uid=30
  }
}
