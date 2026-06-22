class ApiEndPoint {
  ApiEndPoint._();

  static Uri uri(
          {required String path, Map<String, dynamic>? queryParameters}) =>
      Uri(
        scheme: "https",
        host: "rocklis.noouh.com",
        // port: _apiServer.port,
        path: path.replaceAll("https://rocklis.noouh.com", ""),
        queryParameters: queryParameters,
      );

  static String baseUrl = "https://rocklis.noouh.com/api";
  static String attachmentsBaseUrl =
      "https://rocklis.noouh.com/public/storage/";

  // ----------------- Auth -----------------

  static String login = "$baseUrl/auth/login";
  static String register = "$baseUrl/auth/register";
  static String forgotPassword = "$baseUrl/auth/forgot-password";
  static String verifyCode = "$baseUrl/auth/verify-token";
  static String resetPassword = "$baseUrl/auth/reset-password";
  static String logout = "$baseUrl/auth/logout";

  // ----------------- user profile -----------------

  static String getUserprofileData = "$baseUrl/user/get-profile";
  static String changePassword = "$baseUrl/user/update-password";
  static String updateProfile = "$baseUrl/user/update-profile";

  // ----------------- privacy -----------------

  static String submitComplaint = "$baseUrl/complaints/complaint";
  static String submitSupport = "$baseUrl/supports/support";

  // ----------------- Homel -----------------

  static String getHomeBanners = "$baseUrl/home/banners";
  static String getHomeVideo = "$baseUrl/home/mainVideo";
  static String getHomeBlogs = "$baseUrl/home/blogs";
  static String mainProduct = "$baseUrl/home/main_product_data";

  // ----------------- wish list -----------------

  static String getWishList = "$baseUrl/wish-list/wishlist";

  // settings shipping invoices

  static String getAreas = "$baseUrl/orders/get_areas";
  static String getAccountSettings = "$baseUrl/user/get-shipping-invoices";
  static String updateAccountSettings = "$baseUrl/user/shipping-invoices";

  // ----------------- Order History -----------------

  static String getOrderHistory = "$baseUrl/orders/get_orders";
  static String getOrderDetails = "$baseUrl/orders/get_information_order";

  // ----------------- Cancel Order -----------------

  static String cancelOrderWithConfirmStep1 =
      "$baseUrl/orders/request_cancel_order";
  static String cancelOrderWithConfirmStep2 =
      "$baseUrl/orders/verify_cancel_order";
  static String cancelOrderWithoutConfirm = "$baseUrl/orders/cancel_order";

  // ---------------  search -----------------

  static String search = "$baseUrl/search/query_search";
  static String getSuggestionsProduct = "$baseUrl/search/suggest_for_search";

  // ----------------- manage guest Id -----------------

  static String storeGuestId = "$baseUrl/auth/store_guests";
  static String getGuestId = "$baseUrl/cheakguest/found-id-by-guid";

  // ----------------- create wallet -----------------

  static String getPhrases = "$baseUrl/create-wallet/step-two";
  static String verifyPhrases = "$baseUrl/create-wallet/verify-phrase";
  static String importWallet = "$baseUrl/import-wallet";

  // ----------------- discounted product -----------------

  static String discountedProduct = "$baseUrl/home/productByDiscount";

  // ----------------- best selling -----------------

  static String bestSelling = "$baseUrl/home/bestsellers";
  static String contactUs = "$baseUrl/contactus/contact_us";
  static String supportData = "$baseUrl/home/settings";
  static String exploreProducts = "$baseUrl/home/exploreProducts";
  static String siteFeatures = "$baseUrl/home/icons";
  static String productDetails = "$baseUrl/home/productDetails";
  static String similarProducts = "$baseUrl/home/similarProducts";
  static String addReview = "$baseUrl/reviews/add_review_product";
  static String siteReviews = "$baseUrl/reviews/review_for_site";
  static String addToWishlist = "$baseUrl/wish-list/addwishlist";
  static String removeFromWishlist = "$baseUrl/wish-list/removewishlist";
  static String addCart = "$baseUrl/cart/addcart";
  static String gertCart = "$baseUrl/cart/getcart";
  static String removeProduct = "$baseUrl/cart/removeproduct";
  static String deleteCart = "$baseUrl/cart/removeAllcart";
  static String updateCart = "$baseUrl/cart/updatecart";
  static String products = "$baseUrl/Products";
  static String offers = "$baseUrl/Products/getOffers";
  static String categories = "$baseUrl/Products/getCategories";
  static String usages = "$baseUrl/Products/getUsages";
  static String discounts = "$baseUrl/Products/getDiscounts";
  static String areas = "$baseUrl/orders/get_areas";
  static String couponValidation = "$baseUrl/orders/valid_coupon";
  static String orderRequest = "$baseUrl/orders/order_request";

  static String blogByID = "$baseUrl/home/blogbyid";
  static String faqs = "$baseUrl/faqs/get_faqs";
  static String updateDeviceToken =
      "$baseUrl/notifications/update-device-token";
  static String notifications = "$baseUrl/notifications";
}
