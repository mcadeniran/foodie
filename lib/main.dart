import 'package:flutter/material.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/location_controller.dart';
import 'package:foodie/controllers/user_controller.dart';
import 'package:foodie/utils/map_style.dart';
import 'package:get/get.dart';

import './routes/route_helper.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import './helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // To enter FullScreenMode.EMERSIVE_STICKY,
  // await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    // Get.find<UserController>().getUserInfo();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Foodie',
              // home: SignInPage(),
              // home: SplashScreen(),
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
              // theme: ThemeData.dark(),
            );
          },
        );
      },
    );
  }
}
