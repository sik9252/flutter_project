import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';

import 'package:flutter/material.dart';

import 'popular_stock_dummy.dart';

class PopularSearchStockList extends StatefulWidget {
  const PopularSearchStockList({Key? key}) : super(key: key);

  @override
  State<PopularSearchStockList> createState() => _PopularSearchStockListState();
}

class _PopularSearchStockListState extends State<PopularSearchStockList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            '인기 검색'.text.bold.white.size(16).make(),
            emptyExpanded,
            '오늘 ${DateTime.now().formattedTime} 기준'.text.white.size(12).make(),
          ],
        ).pSymmetric(h: 20, v: 15),
        height20,
        ...popularStocks
            .mapIndexed((e, index) => Row(
                  children: [
                    (index + 1).text.bold.white.size(16).make(),
                    width20,
                    e.stockName.text.bold.white.size(16).make(),
                    emptyExpanded,
                    e.todayPercentageString.text
                        .color(e.getTodayPercentageColor(context))
                        .size(16)
                        .make(),
                  ],
                ).pSymmetric(h: 20, v: 20))
            .toList()
      ],
    );
  }
}
