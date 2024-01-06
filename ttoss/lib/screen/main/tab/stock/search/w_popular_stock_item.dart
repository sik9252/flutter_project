import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../vo/vo_popular_stock.dart';

class PopularStockItem extends StatelessWidget {
  final PopularStock stock;
  final int number;

  const PopularStockItem({super.key, required this.stock, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        number.text.make(),
        width30,
        stock.stockName.text.make(),
        emptyExpanded,
        stock.todayPercentageString.text.color(stock.getTodayPercentageColor(context)).make(),
      ],
    );
  }
}
