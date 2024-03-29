import 'package:flutter/material.dart';
import 'package:foodie/base/common_text_button.dart';
import 'package:foodie/base/no_data_page.dart';
import 'package:foodie/base/show_custom_sncakbar.dart';
import 'package:foodie/controllers/auth_controller.dart';
import 'package:foodie/controllers/location_controller.dart';
import 'package:foodie/controllers/order_controller.dart';
import 'package:foodie/controllers/user_controller.dart';
import 'package:foodie/models/place_order_model.dart';
import 'package:foodie/pages/order/delivery_options.dart';
import 'package:foodie/pages/order/payment_option_button.dart';
import 'package:foodie/utils/styles.dart';
import 'package:foodie/widgets/app_text_field.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../controllers/cart_controller.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../utils/dimensions.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _noteController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: AppIcon(
                    icon: Icons.arrow_back,
                    iconColor: AppColors.appMainColor,
                    backgroundColor: AppColors.appActionColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: AppColors.appMainColor,
                    backgroundColor: AppColors.appActionColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: AppColors.appMainColor,
                  backgroundColor: AppColors.appActionColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getItems.isNotEmpty
                  ? Positioned(
                      top: Dimensions.height20 * 5,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height15),
                        // color: Colors.teal,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                itemCount: _cartList.length,
                                itemBuilder: (_, index) {
                                  return SizedBox(
                                    width: double.maxFinite,
                                    height: Dimensions.height20 * 5,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            var popularIndex = Get.find<
                                                    PopularProductController>()
                                                .popularProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (popularIndex >= 0) {
                                              Get.toNamed(
                                                  RouteHelper.getPopularFood(
                                                      popularIndex,
                                                      "cartPage"));
                                            } else {
                                              var recommendedIndex = Get.find<
                                                      RecommendedProductController>()
                                                  .recommendedProductList
                                                  .indexOf(_cartList[index]
                                                      .product!);
                                              if (recommendedIndex < 0) {
                                                Get.snackbar(
                                                  "History Product",
                                                  "Product review is not available for history product",
                                                  backgroundColor:
                                                      AppColors.appTabColor,
                                                  colorText: Colors.white,
                                                );
                                              } else {
                                                Get.toNamed(RouteHelper
                                                    .getRecommendedFood(
                                                        recommendedIndex,
                                                        'cartPage'));
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: Dimensions.height20 * 5,
                                            height: Dimensions.height20 * 5,
                                            margin: EdgeInsets.only(
                                                bottom: Dimensions.height10),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      AppConstants.UPLOAD_URL +
                                                          cartController
                                                              .getItems[index]
                                                              .img!),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width10,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: Dimensions.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: AppColors
                                                      .appMainTextColor,
                                                ),
                                                const SmallText(
                                                  text: "Spicy",
                                                  color:
                                                      AppColors.appSubTextColor,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text:
                                                          "\$${cartController.getItems[index].price!}",
                                                      color: AppColors
                                                          .appActionColor,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        vertical:
                                                            Dimensions.height10,
                                                        horizontal:
                                                            Dimensions.width10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius20),
                                                        color: AppColors
                                                            .appMainTextColor,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .appMainColor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          BigText(
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                            color: AppColors
                                                                .appMainColor,
                                                          ),
                                                          SizedBox(
                                                              width: Dimensions
                                                                      .width10 /
                                                                  2),
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .appMainColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : const NoDataPage(
                      text: "Your cart is empty!",
                    );
            },
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<OrderController>(builder: (orderController) {
        _noteController.text = orderController.foodNote;
        return GetBuilder<CartController>(
          builder: (cartController) {
            return Container(
                height: Dimensions.bottomHeightBar + Dimensions.height20,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.appMainColor,
                  // border: Border.all(color: const Color(0xFF553e2b)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: cartController.getItems.isNotEmpty
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () => showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.9,
                                          decoration: BoxDecoration(
                                            color: AppColors.appMainColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                Dimensions.radius20 / 4,
                                              ),
                                              topRight: Radius.circular(
                                                Dimensions.radius20 / 4,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Dimensions.width20,
                                                  vertical: Dimensions.height20,
                                                ),
                                                height: 600,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const PaymentOptionButton(
                                                      icon: Icons.money,
                                                      title: "Cash on Delivery",
                                                      subtitle:
                                                          "pay after receiving your order.",
                                                      index: 0,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height10,
                                                    ),
                                                    const PaymentOptionButton(
                                                      icon:
                                                          Icons.paypal_outlined,
                                                      title: "Digital Payment",
                                                      subtitle:
                                                          "safer and faster way of payment",
                                                      index: 1,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height30,
                                                    ),
                                                    Text(
                                                      "Delivery options",
                                                      style: robotoMedium,
                                                    ),
                                                    DeliveryOptions(
                                                      value: "delivery",
                                                      title: "Home delivery",
                                                      amount: double.parse(
                                                        Get.find<
                                                                CartController>()
                                                            .totalAmount
                                                            .toString(),
                                                      ),
                                                      isFree: false,
                                                    ),
                                                    DeliveryOptions(
                                                      value: "take away",
                                                      title: "Take away",
                                                      amount: double.parse(
                                                        Get.find<
                                                                CartController>()
                                                            .totalAmount
                                                            .toString(),
                                                      ),
                                                      isFree: true,
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height20,
                                                    ),
                                                    Text(
                                                      "Additonal info",
                                                      style: robotoMedium,
                                                    ),
                                                    AppTextField(
                                                      textController:
                                                          _noteController,
                                                      hintText: "",
                                                      icon: Icons.note,
                                                      maxLines: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).whenComplete(() => orderController
                                .setFoodNote(_noteController.text.trim())),
                            child: const SizedBox(
                              width: double.maxFinite,
                              child: CommonTextButton(text: "Payment options"),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10,
                                  horizontal: Dimensions.width20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20 / 2),
                                  color: AppColors.appMainTextColor,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: Dimensions.width10 / 2),
                                    Row(
                                      children: [
                                        SizedBox(width: Dimensions.width10 / 2),
                                        const BigText(
                                          text: 'Total Price',
                                          color: AppColors.appMainColor,
                                        ),
                                        SizedBox(width: Dimensions.width30),
                                        BigText(
                                          text:
                                              '\$${cartController.totalAmount}',
                                          color: AppColors.appMainColor,
                                        ),
                                        SizedBox(width: Dimensions.width10 / 2),
                                      ],
                                    ),
                                    SizedBox(width: Dimensions.width10 / 2),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Get.find<AuthController>()
                                      .userLoggedIn()) {
                                    // Get.find<UserController>().getUserInfo();
                                    // cartController.addToHistory();
                                    if (Get.find<LocationController>()
                                        .addressList
                                        .isEmpty) {
                                      Get.toNamed(RouteHelper.getAddressPage());
                                    } else {
                                      var location =
                                          Get.find<LocationController>()
                                              .getUserAddress();
                                      var cart =
                                          Get.find<CartController>().getItems;
                                      var user =
                                          Get.find<UserController>().userModel;
                                      PlaceOrderBody placeOrder =
                                          PlaceOrderBody(
                                        cart: cart,
                                        orderAmount: 100,
                                        orderNote: orderController.foodNote,
                                        address: location.address,
                                        latitude: location.latitude!,
                                        longitude: location.longitude!,
                                        contactPersonName: user!.name,
                                        contactPersonNumber: user.phone,
                                        scheduleAt: '',
                                        distance: 6.9,
                                        paymentMethod:
                                            orderController.paymentIndex == 0
                                                ? 'cash_on_delivery'
                                                : 'digital_payment',
                                        orderType: orderController.orderType,
                                      );
                                      Get.find<OrderController>().placeOrder(
                                        placeOrder,
                                        _callback,
                                      );
                                    }
                                  } else {
                                    Get.toNamed(RouteHelper.getSignInPage());
                                  }
                                },
                                child: const CommonTextButton(
                                  text: "Checkout",
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container());
          },
        );
      }),
    );
  }

  void _callback(bool isSuccess, String message, String orderID) {
    if (isSuccess) {
      Get.find<CartController>().clear();
      Get.find<CartController>().removeCartSharedPreference();
      Get.find<CartController>().addToHistory();
      if (Get.find<OrderController>().paymentIndex == 0) {
        Get.offNamed(RouteHelper.getOrderSuccessPage(orderID, "success"));
      } else {
        Get.offNamed(RouteHelper.getPaymentPage(
            orderID, Get.find<UserController>().userModel!.id));
      }
    } else {
      showCustomSnackBar(message);
    }
  }
}
