import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/data/preference/app_preferences.dart';
import 'package:fast_app_base/common/data/preference/prefs.dart';
import 'package:fast_app_base/common/widget/w_big_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/setting/d_number.dart';
import 'package:fast_app_base/screen/opensource/s_opensource.dart';
import 'package:flutter/material.dart';

import 'w_switch_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // bool isPushOn = false;
  //
  // @override
  // void initState() {
  //   isPushOn = Prefs.isPushOn.get();
  //   super.initState();
  // } -> Rx를 통해 주식 탭의 설정 탭에서만 관리되는 것이 아닌 다른 곳에서도 같은 옵션을 전역적으로 관리하도록 할 수 잇음

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: '설정'.text.make(),
      ),
      body: ListView(
        children: [
          Obx(
            () => SwitchMenu('푸시 설정', Prefs.isPushOnRx.get(), onChanged: (isOn) {
              Prefs.isPushOn.set(isOn);
              Prefs.isPushOnRx.set(isOn);
            }),
          ),
          height10,
          Obx(
            () => Slider(
              value: Prefs.sliderPosition.get(),
              onChanged: (value) {
                Prefs.sliderPosition.set(value);
              },
            ),
          ),
          height10,
          Obx(
            () => BigButton(
                "날짜 ${Prefs.birthday.get() == null ? "" : Prefs.birthday.get()?.formattedDate}",
                onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: Prefs.birthday.get(),
                firstDate: DateTime.now().subtract(90.days),
                lastDate: DateTime.now().add(90.days),
              );
              if (date != null) {
                Prefs.birthday.set(date);
              }
            }),
          ),
          height10,
          Obx(
            () => BigButton("저장된 숫자 ${Prefs.number.get()}", onTap: () async {
              final number = await NumberDialog().show();
              if (number != null) {
                Prefs.number.set(number);
              }
            }),
          ),
          height10,
          BigButton('오픈소스 화면', onTap: () async {
            Nav.push(const OpensourceScreen());
          })
        ],
      ),
    );
  }
}
