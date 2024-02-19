import 'package:flutter/material.dart';
import 'package:ui_practice/screens/home/fragments/f_total_balance.dart';
import 'package:ui_practice/screens/home/fragments/f_wallets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const TotalBalance(),
            Container(
              height: 70,
            ),
            const Wallets()
          ],
        ),
      ),
    );
  }
}
