import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'w_popular_search_stock_list.dart';
import 'w_search_auto_complete_list.dart';
import 'w_search_history_stock_list.dart';
import 'w_stock_search_app_bar.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchStockDataProvider {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    Get.put(SearchStockData());
    controller.addListener(() {
      searchData.search(controller.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    // 지우고자 하는 데이터의 타입을 넣어주면 된다
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StockSearchAppBar(controller: controller),
      // Obx 위젯을 사용하여 get controller 내의 Rx 변수들을 직접 관찰해 변화가 있을때마다 갱신
      body: Obx(
        () => searchData.autoCompleteList.isEmpty
            ? ListView(
                children: const [
                  // 위젯 리스트를 넣는데 children의 사이즈가 몇백개면 ListView.builder 사용
                  SearchHistoryStockList(),
                  PopularSearchStockList(),
                ],
              )
            : SearchAutoCompleteList(controller),
      ),
    );
  }
}
