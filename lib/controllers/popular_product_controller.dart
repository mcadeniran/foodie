import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';
import '../models/products_model.dart';
import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print("Numbers of items " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("Numbers of items decreased to " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count", "You can't reduce more!",
        // backgroundColor: AppColors.appTabColor,
        // colorText: Colors.white,
        colorText: AppColors.appMainTextColor,
        // snackPosition: SnackPosition.BOTTOM,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more!",
        // backgroundColor: AppColors.appTabColor,
        // colorText: Colors.white,
        colorText: AppColors.appMainTextColor,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;

    exist = _cart.existInCart(product);
    // If exist
    // get from storage and set to _inCartItems
    // print("Exist or not: " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print("The quantity in the cart is " + inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach(
      (key, value) {
        // print("The id is " +
        //     value.id.toString() +
        //     ". The quantity is " +
        //     value.quantity.toString());
      },
    );
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
