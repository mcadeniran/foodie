import 'package:flutter/material.dart';
import 'package:foodie/base/custom_loader.dart';
import 'package:foodie/controllers/order_controller.dart';
import 'package:foodie/models/order_model.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/utils/styles.dart';
import 'package:get/get.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  String initCap(String val) {
    val = val[0].toUpperCase() + val.substring(1);
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (orderController.isLoading == false) {
          late List<OrderModel> orderList;
          if (orderController.currentOrderList.isNotEmpty) {
            orderList = isCurrent
                ? orderController.currentOrderList.reversed.toList()
                : orderController.historyOrderList.reversed.toList();
          }
          return SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 / 2,
                  vertical: Dimensions.height10 / 2),
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                      onTap: () => {},
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Order ID",
                                    style: robotoRegular.copyWith(
                                        fontSize: Dimensions.font12),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10 / 2,
                                  ),
                                  Text("#${orderList[index].id}"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // width: 82,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width10,
                                        vertical: Dimensions.height10 / 2),
                                    decoration: BoxDecoration(
                                        color: AppColors.appMainTextColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20 / 5)),
                                    child: Text(
                                      initCap(orderList[index]
                                          .orderStatus
                                          .toString()),
                                      style: robotoMedium.copyWith(
                                          fontSize: Dimensions.font12,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 / 2,
                                  ),
                                  InkWell(
                                    onTap: () => {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.appMainColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20 / 5),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColors.appMainTextColor),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            Dimensions.height10 / 2),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/image/tracking.png",
                                              color: AppColors.appMainTextColor,
                                              height: 15,
                                              width: 15,
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            Text(
                                              "Track order",
                                              style: robotoMedium.copyWith(
                                                  fontSize: Dimensions.font12,
                                                  color: AppColors
                                                      .appMainTextColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          )
                        ],
                      ));
                }),
              ),
            ),
          );
        } else {
          return const CustomLoader();
        }
      }),
    );
  }
}
