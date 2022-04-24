import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    super.initState();

    _loadResources();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );

    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.getInitial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            // child: Center(
            //   child: Image.asset(
            //     "assets/image/logo part 1.png",
            //     width: Dimensions.splashImg,
            //   ),
            child: Image.asset(
              "assets/image/foodie_1.png",
              width: Dimensions.splashImg,
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/foodie_2.png",
              width: Dimensions.splashImg,
            ),
            // child: Image.asset(
            //   "assets/image/logo part 2.png",
            //   width: Dimensions.splashImg,
            // ),
          ),
        ],
      ),
    );
  }
}
