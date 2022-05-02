import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height20 * 5,
        width: Dimensions.height20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.height20 * 2.5,
          ),
          color: AppColors.appTabColor,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
