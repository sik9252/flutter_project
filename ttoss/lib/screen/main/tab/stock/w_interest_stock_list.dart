import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import 'stocks_dummy.dart';
import 'w_stock_item.dart';

class InterestStockList extends StatefulWidget {
  const InterestStockList({Key? key}) : super(key: key);

  @override
  State<InterestStockList> createState() => _InterestStockListState();
}

class _InterestStockListState extends State<InterestStockList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.mainDarkBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          ...myInterestStocks.map((e) => StockItem(e)).toList(),
        ],
      ),
    );
  }
}
