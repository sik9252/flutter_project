import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/benefit/vo/vo_benefit.dart';
import 'package:flutter/material.dart';

class BenefitItemWidget extends StatelessWidget {
  final Benefit benefit;

  const BenefitItemWidget({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(benefit.imagePath, width: 50, height: 50),
        width10,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            benefit.title.text.size(13).make(),
            height5,
            benefit.subTitle.text
                .size(13)
                .color(context.appColors.blueText)
                .make(),
          ],
        )
      ],
    ).pSymmetric(v: 20);
  }
}
