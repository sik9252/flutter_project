import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:fast_app_base/screen/main/tab/benefit/benefits_dummy.dart';
import 'package:fast_app_base/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../common/cli_common.dart';
import '../../../../common/widget/w_height_and_width.dart';
import '../home/w_ttos_app_bar.dart';
import 'w_point_button.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.mainDarkBackground,
      child: RefreshIndicator(
        edgeOffset: TtossAppBar.appBarHeight,
        onRefresh: () async {
          await sleepAsync(500.ms);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
              bottom: MainScreenState.bottonNavigatorHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height30,
              "혜택".text.white.bold.size(18).make(),
              height30,
              const PointButtonWidget(point: 1569),
              height20,
              "혜택 더 받기".text.white.bold.size(16).make(),
              ...benefitList
                  .map((benefit) => BenefitItemWidget(benefit: benefit))
            ],
          ).pSymmetric(h: 20),
        ),
      ),
    );
  }
}
