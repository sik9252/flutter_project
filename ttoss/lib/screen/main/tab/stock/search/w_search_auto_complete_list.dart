import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_stock_detail.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  // 방법 1.
  // late final searchData = Get.find<SearchStockData>();

  // 방법 2.
  // abstract mixin을 이용해서 with SearchStockDataProvider과 같이 추가

  final TextEditingController controller;

  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = searchData.autoCompleteList[index].stockName;
        return Tap(
            onTap: () {
              controller.clear();
              searchData.addSearchHistory(stock);
              Nav.push(StockDetailScreen(stockName: stockName));
            },
            child: stockName.text.make().p(20));
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
