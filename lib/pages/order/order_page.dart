import 'package:flutter/material.dart';
import 'package:foodie/controllers/auth_controller.dart';
import 'package:foodie/pages/order/view_order.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/order_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/big_text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        leading: const BackButton(
          color: AppColors.appMainTextColor,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.appComplimentColor,
        ),
        title: const BigText(
          text: "My Orders",
          size: 24,
          color: AppColors.appMainTextColor,
        ),
      ),
      backgroundColor: AppColors.appMainColor,
      body: _isLoggedIn
          ? Column(
              children: [
                SizedBox(
                  width: Dimensions.screenWidth,
                  child: TabBar(
                    indicatorColor: AppColors.appMainTextColor,
                    indicatorWeight: 3,
                    labelColor: AppColors.appMainTextColor,
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        text: "Current",
                      ),
                      Tab(
                        text: "History",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      ViewOrder(isCurrent: true),
                      ViewOrder(isCurrent: false),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.height20 * 8,
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
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
                          left: Dimensions.width20, right: Dimensions.width20),
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
            ),
    );
  }
}
