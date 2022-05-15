import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/utils/colors.dart';
import 'package:get/get.dart';

import './routes/route_helper.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import './helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  // await SystemChrome.setEnabledSystemUIMode(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.transparent
  //   ),
  // );
  // const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.red,
  //   statusBarColor: Colors.pink,
  // );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor: AppColors.appTabColor,
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Color(0xFF1487E1),
      // systemNavigationBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.appActionColor,
      // systemNavigationBarColor: AppColors.appTabColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
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
