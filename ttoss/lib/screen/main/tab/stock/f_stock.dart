import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/w_image_button.dart';
import '../../s_main.dart';
import '../home/w_ttos_app_bar.dart';
import 'search/s_search_stock.dart';
import 'tab/f_my_stock.dart';
import 'tab/f_today_discovery.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> with SingleTickerProviderStateMixin {
  // final TabController tabController = TabController(length: 2, vsync: this); 로 바로 해버리면 아직 _StockFragmentState가 생성 안되었을때, this를 인식 못하는 상황 발생
  // 따라서 아래와 같이 nullable로 선언해두고 initState를 통해 초기화하는 방법이 있음

  // TabController? tabController;
  //
  // @override
  // void initState() {
  //   tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

  // initState를 사용하지 않는 두번째 방법, 대신 얘는 생성자가 실행되는 생성 타임이 아닌 tabController가 필요해진 시점에 실행
  late final TabController tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: MainScreenState.bottonNavigatorHeight),
      color: context.appColors.mainDarkBackground,
      child: RefreshIndicator(
        edgeOffset: TtossAppBar.appBarHeight,
        onRefresh: () async {
          await sleepAsync(500.ms);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: context.appColors.roundedLayoutBackground,
              pinned: true,
              actions: [
                ImageButton(
                  imagePath: '$basePath/icon/stock_search.png',
                  onTap: () => Nav.push(const SearchStockScreen())
                ),
                ImageButton(
                  imagePath: '$basePath/icon/stock_calendar.png',
                  onTap: () => context.showSnackbar('캘린더'),
                ),
                ImageButton(
                  imagePath: '$basePath/icon/stock_settings.png',
                  onTap: () => context.showSnackbar('설정'),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  title,
                  tabBar,
                  if (currentIndex == 0) const MyStockFragment() else const TodayDiscovertFragment()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            height10,
            "토스증권".text.size(24).bold.make(),
            width20,
            "S&P 500".text.size(13).bold.color(context.appColors.lessImportant).make(),
            width10,
            3919.29.toComma().text.size(13).bold.color(context.appColors.plus).make()
          ],
        ).pOnly(left: 20),
      );

  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                labelPadding: const EdgeInsets.symmetric(vertical: 20),
                indicatorSize: TabBarIndicatorSize.tab,
                // indicator의 가로 길이를 하나의 탭 길이만큼으로 지정
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.white,
                controller: tabController,
                tabs: ['내 주식'.text.make(), '오늘의 발견'.text.make()]),
            const Line()
          ],
        ),
      );
}
