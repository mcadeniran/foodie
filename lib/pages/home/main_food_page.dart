import 'package:flutter/material.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';

import '../../widgets/small_text.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.appActionColor,
      backgroundColor: AppColors.appMainColor,
      onRefresh: _loadResources,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: Dimensions.height45,
              bottom: Dimensions.height15,
            ),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const BigText(
                      text: "Utopia",
                      color: AppColors.appMainTextColor,
                      size: 30,
                    ),
                    Row(
                      children: const [
                        SmallText(
                          text: "Gotham",
                          color: AppColors.appSubTextColor,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: AppColors.appSubTextColor,
                        )
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.appActionColor,
                    ),
                    child: Icon(
                      Icons.search,
                      color: AppColors.appMainColor,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
