import 'package:flutter/material.dart';
import 'package:foodie/base/custom_loader.dart';
import 'package:foodie/controllers/order_controller.dart';
import 'package:foodie/models/order_model.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
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
                              Text("Order ID      #${orderList[index].id}"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 82,
                                    decoration: BoxDecoration(
                                        color: AppColors.appMainTextColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20 / 5)),
                                    child: Container(
                                      margin: EdgeInsets.all(
                                          Dimensions.height10 / 2),
                                      child: Text(
                                        initCap(orderList[index]
                                            .orderStatus
                                            .toString()),
                                        style: const TextStyle(
                                            color: AppColors.appMainColor),
                                      ),
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
                                        margin: EdgeInsets.all(
                                            Dimensions.height10 / 2),
                                        child: const Text(
                                          "Track order",
                                          style: TextStyle(
                                              color:
                                                  AppColors.appMainTextColor),
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
