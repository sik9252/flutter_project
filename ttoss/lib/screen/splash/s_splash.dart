import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';

// 기본적으로 s_main.dart와 main.dart에 사용한것처럼 하는 경우가 많지만,
// 이렇게 플러터 스플래시 파일을 따로 만들어서 사용하는 경우도 존재함

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    delay(() {
      Nav.clearAllAndPush(const MainScreen());
    }, 1500.ms);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/image/splash/splash.png", width: 192, height: 192),
    );
  }
}
