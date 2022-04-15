// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'FOODIE';
  static const int APP_VERSION = 1;

  // static const String BASE_URL = 'http://192.168.137.1:8000';
  static const String BASE_URL = 'http://mvs.bslmeiyu.com';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';
  static const String UPLOAD_URL = BASE_URL + '/uploads/';

  static const String TOKEN = 'FoodieToken';
  static const String CART_LIST = "Cart-list";
}