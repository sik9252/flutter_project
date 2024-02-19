import 'package:flutter/material.dart';
import 'package:ui_practice/common/common.dart';
import 'package:ui_practice/screens/home/widget/w_wallet_item.dart';

class Wallets extends StatelessWidget {
  const Wallets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wallets',
              style: TextStyle(color: AppColors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            ExpandedWidget(),
            Text(
              'View All',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
        height20,
        Column(
          children: [
            WalletItem(
              name: 'Euro',
              unit: 'EUR',
              amount: '6 428',
              icon: Icon(Icons.euro_rounded, color: AppColors.white, size: 88),
            ),
            WalletItem(
              name: 'Bitcoin',
              unit: 'BTC',
              amount: '55 622',
              icon: Icon(Icons.currency_bitcoin, color: AppColors.black, size: 88),
              backgroundColor: AppColors.white,
              offset: Offset(0, -20),
            ),
            WalletItem(
              name: 'Dollar',
              unit: 'USD',
              amount: '28 981',
              icon: Icon(Icons.attach_money_outlined, color: AppColors.white, size: 88),
              offset: Offset(0, -40),
            ),
          ],
        )
      ],
    );
  }
}
