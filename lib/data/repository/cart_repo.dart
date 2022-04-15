import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    // for (var element in cartList) {
    //   return cart.add(jsonEncode(element));
    // }

    cartList.forEach((element) => cart.add(jsonEncode(element)));

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    print("Should print");
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList " + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach((element) => CartModel.fromJson(jsonDecode(element)));

    // for (var element in carts) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // }

    return cartList;
  }
}
