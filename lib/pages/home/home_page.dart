import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../pages/order/order_page.dart';
import '../../pages/account/account_page.dart';
import '../../pages/cart/cart_history.dart';
import '../../pages/home/main_food_page.dart';
import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    const MainFoodPage(),
    const OrderPage(),
    const CartHistory(),
    const AccountPage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color selectedColor() {
    return AppColors.appMainColor;
  }

  Color unSelectedColor() {
    return AppColors.appTabColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: AppColors.appTabColor,
        ),
        child: NavigationBar(
          backgroundColor: AppColors.appMainColor,
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: Dimensions.height20 * 2.5,
          selectedIndex: _selectedIndex,
          onDestinationSelected: onTapNav,
          destinations: [
            NavigationDestination(
                selectedIcon: Icon(Icons.home, color: selectedColor()),
                icon: Icon(Icons.home_outlined, color: unSelectedColor()),
                label: "Home"),
            NavigationDestination(
              selectedIcon: Icon(Icons.archive, color: selectedColor()),
              icon: Icon(
                Icons.archive_outlined,
                color: unSelectedColor(),
              ),
              label: "History",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart, color: selectedColor()),
              icon:
                  Icon(Icons.shopping_cart_outlined, color: unSelectedColor()),
              label: "Cart",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person, color: selectedColor()),
              icon: Icon(Icons.person_outlined, color: unSelectedColor()),
              label: "Me",
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: AppColors.appTabColor,
    //     unselectedItemColor: Colors.amberAccent,
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     selectedFontSize: 0.0,
    //     unselectedFontSize: 0.0,
    //     currentIndex: _selectedIndex,
    //     onTap: onTapNav,
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home_outlined),
    //         label: "Home",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.archive),
    //         label: "History",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.shopping_cart),
    //         label: "Cart",
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: "Me",
    //       ),
    //     ],
    //   ),
    // );
  }
}
