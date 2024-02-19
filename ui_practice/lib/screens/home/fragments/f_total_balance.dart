import 'package:flutter/material.dart';
import 'package:ui_practice/common/common.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Total Balance',
          style: TextStyle(color: AppColors.white, fontSize: 22),
        ),
        const Text(
          '\$5 194 382',
          style: TextStyle(color: AppColors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        height20,
        Row(
          children: [
            Expanded(
              child: RoundedButton(
                  width: double.infinity,
                  height: 60,
                  fontSize: 18,
                  buttonText: 'Transfer',
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.black,
                  onTap: () {}),
            ),
            width20,
            Expanded(
                child: RoundedButton(
                    width: double.infinity,
                    height: 60,
                    fontSize: 18,
                    buttonText: 'Request',
                    backgroundColor: AppColors.semiBlack,
                    textColor: AppColors.white,
                    onTap: () {}))
          ],
        )
      ],
    );
  }
}
