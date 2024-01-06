import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final EdgeInsets? margin;
  final Color? backgroundColor;

  const RoundedContainer(
      {required this.child,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      this.radius = 20,
      this.margin,
      this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: backgroundColor ?? context.appColors.roundedLayoutBackground,
            borderRadius: BorderRadius.circular(radius)),
        child: child);
  }
}
