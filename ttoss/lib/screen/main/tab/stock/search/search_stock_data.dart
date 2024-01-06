import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/common.dart';
import '../../../../../common/util/local_json.dart';
import '../vo/vo_simple_stock.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    loadLocalStockJson();

    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>("json/stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String text) {
    if (isBlank(text)) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks.where((element) => element.stockName.contains(text)).toList();
  }

  void addSearchHistory(SimpleStock stock) {
    searchHistoryList.add(stock.stockName);
  }
}
