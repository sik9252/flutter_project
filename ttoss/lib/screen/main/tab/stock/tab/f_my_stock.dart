import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../../../../common/common.dart';
import '../../../../../common/widget/w_long_button.dart';
import '../w_interest_stock_list.dart';

class MyStockFragment extends StatelessWidget {
  const MyStockFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getMyAccount(context), height20, getMyStock(context)],
    );
  }

  // Stateless에서는 context에 접근 불가, 따라서 전달해줘야 하는데 getter로는 전달 불가, 함수로 바꾸어서 전달
  Widget getMyAccount(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height20,
            '계좌'.text.make(),
            Row(
              children: [
                '443원'.text.size(24).bold.make(),
                const Arrow(),
                emptyExpanded,
                RoundedContainer(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  radius: 8,
                  backgroundColor: context.appColors.buttonBackground,
                  child: '채우기'.text.size(12).make(),
                ),
              ],
            ),
            height20,
            Line(color: context.appColors.divider),
            height10,
            const LongButton(title: '주문내역'),
            const LongButton(title: '판매수익'),
          ],
        ),
      );

  Widget getMyStock(BuildContext context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: context.appColors.roundedLayoutBackground,
            child: Column(
              children: [
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    '관심 주식'.text.bold.make(),
                    '편집하기'.text.color(context.appColors.lessImportant).make()
                  ],
                ),
                height20,
                Tap(
                  onTap: () {
                    context.showSnackbar('기본');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '기본'.text.make(),
                        const Arrow(
                          direction: AxisDirection.up,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const InterestStockList().pSymmetric(h: 20),
        ],
      );
}