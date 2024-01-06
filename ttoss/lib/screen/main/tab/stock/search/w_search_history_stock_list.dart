import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_search_history_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_stock_detail.dart';
import 'search_stock_data.dart';

class SearchHistoryStockList extends StatefulWidget {
  const SearchHistoryStockList({Key? key}) : super(key: key);

  @override
  State<SearchHistoryStockList> createState() => _SearchHistoryStockListState();
}

class _SearchHistoryStockListState extends State<SearchHistoryStockList>
    with SearchStockDataProvider {
  late final searchHistoryData = Get.find<SearchStockData>();

  get historyList => searchData.searchHistoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Obx(
        () => historyList.isEmpty
            ? '최근 검색어가 없습니다'
                .text
                .color(context.appColors.lessImportant)
                .size(13)
                .make()
                .pOnly(left: 20)
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  return SearchHistoryItem(
                    onTapDelete: () {
                      setState(() {
                        historyList.removeAt(index);
                      });
                    },
                    onTapMove: () {
                      Nav.push(StockDetailScreen(stockName: historyList[index]));
                    },
                    text: historyList[index],
                  );
                },
              ),
      ),
    );
  }
}
