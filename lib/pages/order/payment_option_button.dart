import 'package:flutter/material.dart';
import 'package:foodie/controllers/order_controller.dart';
import 'package:get/get.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/utils/styles.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int index;

  const PaymentOptionButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      bool selected = orderController.paymentIndex == index;
      return InkWell(
        onTap: () => orderController.setPaymentIndex(index),
        child: Container(
          margin: EdgeInsets.only(bottom: Dimensions.height10 / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
              color: Theme.of(context).cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ]),
          child: ListTile(
            leading: Icon(
              icon,
              size: 40,
              color: selected
                  ? AppColors.appActionColor
                  : Theme.of(context).disabledColor,
            ),
            title: Text(
              title,
              style: robotoMedium.copyWith(
                fontSize: Dimensions.font20,
              ),
            ),
            subtitle: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.font16,
                color: Theme.of(context).disabledColor,
              ),
            ),
            trailing: selected
                ? const Icon(
                    Icons.check_circle,
                    color: AppColors.appActionColor,
                  )
                : null,
          ),
        ),
      );
    });
  }
}
