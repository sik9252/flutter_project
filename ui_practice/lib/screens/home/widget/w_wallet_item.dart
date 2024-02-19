import 'package:flutter/material.dart';
import 'package:ui_practice/common/common.dart';

class WalletItem extends StatelessWidget {
  final Color? backgroundColor;

  final String name;
  final String unit;
  final String amount;
  final Icon? icon;

  final Offset? offset;

  const WalletItem(
      {this.backgroundColor,
      required this.name,
      required this.unit,
      required this.amount,
      this.icon,
      this.offset,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset ?? const Offset(0, 0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.semiBlack,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: backgroundColor != null ? AppColors.black : AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  height10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                            color: backgroundColor != null ? AppColors.black : AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                      width10,
                      Text(
                        unit,
                        style: TextStyle(
                            color: backgroundColor != null ? AppColors.black : AppColors.white,
                            fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  // child: const Icon(Icons.euro_rounded, color: AppColors.white, size: 88),
                  child: icon ?? const Icon(Icons.euro_rounded, color: AppColors.white, size: 88),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
