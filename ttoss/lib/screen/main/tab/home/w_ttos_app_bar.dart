import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class TtossAppBar extends StatefulWidget {
  // 여러곳에서 쓰이는 상수를 핵심적인 한 곳에 적어두어 유지보수성을 향상
  static const double appBarHeight = 60;
  const TtossAppBar({super.key});

  @override
  State<TtossAppBar> createState() => _TtossAppBarState();
}

class _TtossAppBarState extends State<TtossAppBar> {
  bool _showRedDot = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: TtossAppBar.appBarHeight,
        color: context.appColors.appBarBackground,
        child: Row(
          children: [
            width10,
            Image.asset("$basePath/icon/toss.png", height: 30),
            emptyExpanded,
            Image.asset("$basePath/icon/map_point.png", height: 30),
            width10,
            InkWell(
              onTap:(){
                setState(() {
                  _showRedDot = !_showRedDot;
                });
              },
              child: Stack(
                children: [
                  Image.asset("$basePath/icon/notification.png", height: 30),
                  if(_showRedDot)Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            ),
            width10,
          ],
        ));
  }
}
