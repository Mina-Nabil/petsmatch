class URLs {
  static final String host = "https://petmatch.msquare.app/api";
  // static final String host = "http://127.0.0.1:8000/api";
  String media;
  String mediaLocal;
  String login;
  String me;
  String notifications;
  String register;
  String createPet;
  String showMyPets;
  String showOtherPets;
  String getAPet;
  String createPost;
  String postPet;
  String lovePost;
  String getAPost;
  String getNewsFeed;
  String getYourPosts;
  String createComment;
  String getPostComments;
  String getAComment;
  String search;
  String updateUserData;
  String crush;
  String myCrush;
  String crushOnMe;
  String family;
  String mate;
  static final String sendMessage = "$host/message";
  static final String getChat = "$host/chat";
  static final String getMyChats = "$host/chats";
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
  static final String getUser = "$host/me"; // ?uid=30
  static final String getUserNotifications =
      "$host/api/return/user/notifications"; // ?uid=30&page=0
  static final String editUserNotifications =
      "$host/api/update/user/notifications"; // ?uid=30&id=30
  static final String getUserRecentNotifications =
      "$host/api/return/recent/user/notifications"; // ?uid=30
  static final String getQuote =
      "$host/api/return/quote/data"; // ?uid=37&id=573
  URLs() {
    showMyPets = "$host/subprofile";
    media = "https://petmatch.msquare.app";
    mediaLocal = "http://127.0.0.1:8001";
    // "https://petsmatch-be.herokuapp.com";
    showOtherPets = "$host/show/subprofile";
    crush = "$host/crush";
    me = "$host/me";
    myCrush = "$host/crushes";
    crushOnMe = "$host/crush";
    family = "$host/family";
    mate = "$host/mate";
    notifications = "$host/notifications";
    login = "$host/login";
    lovePost = "$host/love";
    //login = "$host/my-api/login-user.json";
    register = "$host/register";
    createPet =
        "$host/subprofile"; // ?uid=53&title=22&lat=11&postal_code=33&working_hour=22&lng=3
    getAPet =
        "$host/api/pet"; // ?nid=440&title=333&working_hour=33&postal_code=22&lat=2&lng=5
    createPost = "$host/post"; // ?uid=53
    postPet = "$host/pet/post"; // ?uid=53
    getAPost = "$host/post"; // ?uid=53
    getYourPosts = "$host/api/post"; // ?uid=53
    getNewsFeed = "$host/news-feed"; // ?uid=53
    createComment = "$host/api/comment"; // ?uid=53
    getPostComments = "$host/post/comments"; // ?uid=53
    getAComment = "$host/api/news-feed"; // ?uid=53
    updateUserData = "$host/api/me"; // ?uid=30
    search = "$host/search"; // ?uid=30
  }
}
