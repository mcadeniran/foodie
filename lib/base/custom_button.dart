import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double radius;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.height,
      this.width,
      this.fontSize,
      this.radius = 5,
      this.icon,
      this.backgroundColor = AppColors.appMainTextColor,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _flatButton = TextButton.styleFrom(
      // primary: AppColors.appMainColor,
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : backgroundColor,
      maximumSize: Size(width != null ? width! : Dimensions.screenWidth,
          height != null ? height! : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
    return Center(
      child: SizedBox(
        width: width ?? Dimensions.screenWidth,
        height: height ?? 50,
        child: TextButton(
          onPressed: onPressed,
          style: _flatButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: Dimensions.width10 / 2,
                      ),
                      child: Icon(
                        icon,
                        color: transparent
                            ? AppColors.appMainColor
                            // : Theme.of(context).cardColor,
                            : textColor,
                      ),
                    )
                  : const SizedBox(),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: fontSize ?? Dimensions.font16,
                  color:
                      transparent ? Theme.of(context).primaryColor : textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
