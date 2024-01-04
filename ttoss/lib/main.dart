import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';

void main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  // flutter native splash 패키지 안에서 기존의 네이티브 화면을 보존 & 유지 시켜줌
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
