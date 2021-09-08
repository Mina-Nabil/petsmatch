class URLs {
  // http://maya-edu.ml:81   ---   http://172.30.121.224 --- http://kinetics-crm.ml:81/up4quote/
  //static final String host = "http://kinetics-crm.ml:81/up4quote";
  static final String host = "http://127.0.0.1:8000/api";
  String login;
  String register;
  String userQuoteList;
  String recentQuoteList;
  String userFavoriteQuoteList;
  String switchToFavorite;
  String addQuote;
  String getCategories;
  String getPostalCode;
  String addComment;
  String getComments;
  String addQuotation;
  String getQuoteQuotation;
  String getPendingQuotes;
  String getHistoryQuotes;
  String getUsers;
  String getProducts;
  String getSupplierProducts;
  String getSchedules;
  String addSchedule;
  String deleteSchedule;
  String editSchedule;
  String getUserCategories;
  String updateUserData;
  String updateUserCategories;
  String addPet;
  String updatePet;
  String getPet;
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
  static final String getUser =
      "$host/api/handle/return/all/user/data"; // ?uid=30
  static final String getUserNotifications =
      "$host/api/return/user/notifications"; // ?uid=30&page=0
  static final String editUserNotifications =
      "$host/api/update/user/notifications"; // ?uid=30&id=30
  static final String getUserRecentNotifications =
      "$host/api/return/recent/user/notifications"; // ?uid=30
  static final String getQuote =
      "$host/api/return/quote/data"; // ?uid=37&id=573
  URLs() {
    login = "$host/login";
    //login = "$host/my-api/login-user.json";
    register = "$host/register";
    userQuoteList = "$host/api/return/user/quotes";
    recentQuoteList =
        "$host/return/all/quotes"; // ?page=18&category=5&category=6
    addQuote = "$host/api/handle/new/quote";
    getCategories = "$host/api/return/all/categories";
    updateUserCategories = "$host/handle/users/update/category";
    getPostalCode = "$host/api/handle/return/postal/code/location";
    addComment = "$host/handle/new/comment";
    getComments = "$host/return/provider/comment";
    addQuotation = "$host/handle/new/quotation";
    getQuoteQuotation = "$host/return/quote/quotations";
    getPendingQuotes =
        "$host/api/return/provider/pending/quotations"; // ?pid=29
    getHistoryQuotes = "$host/api/return/provider/quotations"; // ?pid=29
    userFavoriteQuoteList = "$host/api/return/provider/fav/quotes"; // ?pid=1
    switchToFavorite = "$host/handle/new/fav/quote"; // ?pid=29&quote_nid=247
    getUsers =
        "$host/api/handle/return/all/suppliers"; //?uid=1&type=supplier&page=0 || type = supplier or provider
    getUserCategories =
        "$host/api/handle/return/all/suppliers/categories"; // ?id=20
    getProducts = "$host/api/return/all/products";
    getSupplierProducts = "$host/api/return/supplier/products"; // ?sid=20
    addSchedule =
        "$host/api/handle/new/schedule"; // ?title=ss44s&uid=29&from=1s1&to=3245&desc=222
    editSchedule =
        "$host/api/handle/edit/schedule"; // ?id=311&title=someTitle&status=1&uid=29&from=1s1&to=3245&desc=222
    deleteSchedule = "$host/api/handle/delete/schedule"; // ?nid=311
    getSchedules = "$host/api/return/all/schedule"; // ?uid=29
    updateUserData = "$host/handle/users/update"; // ?uid=53
    addPet =
        "$host/api/handle/new/Pet"; // ?uid=53&title=22&lat=11&postal_code=33&working_hour=22&lng=3
    updatePet =
        "$host/api/handle/edit/Pet"; // ?nid=440&title=333&working_hour=33&postal_code=22&lat=2&lng=5
    getPet = "$host/api/return/Pet"; // ?uid=53
  }
}
