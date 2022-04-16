import 'package:flutter/material.dart';

import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/account_widget.dart';
import 'package:foodie/widgets/app_icon.dart';
import 'package:foodie/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
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
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 2.5,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: "Kolawole"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 2.5,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: "+90-533-853-7625"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 2.5,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText:
                          const BigText(text: "kolawole.adeniran@emu.edu.tr"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 2.5,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: "Fill in your address"),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 2.5,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: const BigText(text: "Message Me"),
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
      ),
    );
  }
}
