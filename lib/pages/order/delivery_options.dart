import 'package:flutter/material.dart';
import 'package:foodie/controllers/order_controller.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/utils/styles.dart';
import 'package:get/get.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;
  const DeliveryOptions(
      {Key? key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (orderController) {
        return Row(
          children: [
            Radio(
              activeColor: AppColors.appMainTextColor,
              value: value,
              groupValue: orderController.orderType,
              onChanged: (String? value) =>
                  orderController.setDeliveryType(value!),
            ),
            SizedBox(width: Dimensions.width10 / 2),
            Text(
              title,
              style: robotoRegular.copyWith(fontSize: Dimensions.font16),
            ),
            SizedBox(width: Dimensions.width10 / 2),
            Text(
              '(${(value == 'take away' || isFree) ? 'Free' : '\$${amount / 10}'})',
              style: robotoMedium.copyWith(fontSize: Dimensions.font16),
            ),
          ],
        );
      },
    );
  }
}
