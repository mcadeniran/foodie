import 'package:flutter/material.dart';
import 'package:foodie/widgets/big_text.dart';

import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonExist;
  final Function? onBackPress;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.backButtonExist = true,
      this.onBackPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appMainColor,
      elevation: 0,
      title: BigText(
        text: title,
        color: AppColors.appMainTextColor,
      ),
      centerTitle: true,
      leading: backButtonExist
          ? IconButton(
              onPressed: () => onBackPress != null
                  ? onBackPress!()
                  : Navigator.pushReplacementNamed(context, "/initial"),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.appMainTextColor,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(500, 53);
}
