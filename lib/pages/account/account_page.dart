import 'package:flutter/material.dart';
import 'package:foodie/base/custom_loader.dart';
import 'package:foodie/controllers/auth_controller.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/location_controller.dart';
import 'package:foodie/controllers/user_controller.dart';
import 'package:foodie/routes/route_helper.dart';

import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/account_widget.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      Get.find<LocationController>().getAddressList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        iconTheme: const IconThemeData(
          color: AppColors.appComplimentColor,
        ),
        title: const BigText(
          text: "Profile",
          size: 24,
          color: AppColors.appMainTextColor,
        ),
      ),
      backgroundColor: AppColors.appMainColor,
      body: GetBuilder<UserController>(
        builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.appTabColor,
                            iconColor: AppColors.appMainColor,
                            iconSize: Dimensions.height15 * 5,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.appTabColor,
                                      iconColor: AppColors.appMainColor,
                                      iconSize: Dimensions.height10 * 2.5,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        color: AppColors.appSubTextColor,
                                        text: userController.userModel!.name),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.appTabColor,
                                      iconColor: AppColors.appMainColor,
                                      iconSize: Dimensions.height10 * 2.5,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        color: AppColors.appSubTextColor,
                                        text: userController.userModel!.phone),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.appTabColor,
                                      iconColor: AppColors.appMainColor,
                                      iconSize: Dimensions.height10 * 2.5,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        color: AppColors.appSubTextColor,
                                        text: userController.userModel!.email),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  GetBuilder<LocationController>(
                                      builder: (locationController) {
                                    if (_userLoggedIn &&
                                        locationController
                                            .addressList.isEmpty) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.location_on,
                                            backgroundColor:
                                                AppColors.appTabColor,
                                            iconColor: AppColors.appMainColor,
                                            iconSize: Dimensions.height10 * 2.5,
                                            size: Dimensions.height10 * 5,
                                          ),
                                          bigText: const BigText(
                                              color: AppColors.appSubTextColor,
                                              text: "Fill in your address"),
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.offNamed(
                                              RouteHelper.getAddressPage());
                                        },
                                        child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.location_on,
                                            backgroundColor:
                                                AppColors.appTabColor,
                                            iconColor: AppColors.appMainColor,
                                            iconSize: Dimensions.height10 * 2.5,
                                            size: Dimensions.height10 * 5,
                                          ),
                                          bigText: const BigText(
                                              color: AppColors.appSubTextColor,
                                              text: "Your address"),
                                        ),
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: AppColors.appTabColor,
                                      iconColor: AppColors.appMainColor,
                                      iconSize: Dimensions.height10 * 2.5,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: const BigText(
                                        color: AppColors.appSubTextColor,
                                        text: "Messages"),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearHistory();
                                        Get.find<LocationController>()
                                            .clearAddressList();
                                        Get.offNamed(
                                            RouteHelper.getSignInPage());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: AppColors.appTabColor,
                                        iconColor: AppColors.appMainColor,
                                        iconSize: Dimensions.height10 * 2.5,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: const BigText(
                                          color: AppColors.appSubTextColor,
                                          text: "Logout"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height30,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimensions.height20 * 8,
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                // AssetImage("assets/image/signintocontinue.png"),
                                AssetImage("assets/image/foodie_2.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                            color: AppColors.appActionColor,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius20,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                              Icon(
                                Icons.account_box,
                                color: AppColors.appMainColor,
                                size: Dimensions.iconSize16 * 2,
                              ),
                              BigText(
                                text: "Sign in",
                                color: AppColors.appMainColor,
                                size: Dimensions.font26,
                              ),
                              SizedBox(
                                width: Dimensions.width20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
