import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import './icon_and_text_widget.dart';
import './big_text.dart';
import './small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(Icons.star,
                    color: AppColors.appTabColor, size: 15),
              ),
            ),
            const SizedBox(width: 10),
            const SmallText(text: "4.5"),
            const SizedBox(width: 10),
            const SmallText(text: "1275"),
            const SizedBox(width: 5),
            const SmallText(text: "Comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.appTabColor),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.appActionColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.appComplimentColor),
          ],
        ),
      ],
    );
  }
}
