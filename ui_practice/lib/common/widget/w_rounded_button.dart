import 'package:flutter/material.dart';
import 'package:ui_practice/common/colors/colors.dart';

class RoundedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;

  final String buttonText;

  final Color? backgroundColor;
  final Color? textColor;

  final Function() onTap;

  const RoundedButton(
      {this.width,
      this.height,
      this.fontSize,
      required this.buttonText,
      this.backgroundColor,
      this.textColor,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        width: width ?? 100,
        height: height ?? 48,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.black,
          borderRadius: BorderRadius.circular(height != null ? height! / 2 : 24),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor ?? AppColors.black, fontSize: fontSize ?? 16),
          ),
        ),
      ),
    );
  }
}
