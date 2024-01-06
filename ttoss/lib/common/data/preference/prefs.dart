import 'package:fast_app_base/common/data/preference/item/nullable_preference_item.dart';
import 'package:fast_app_base/common/data/preference/item/preference_item.dart';
import 'package:fast_app_base/common/theme/custom_theme.dart';

import 'item/rx_preference_item.dart';
import 'item/rxn_preference_item.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
  static final isPushOn = PreferenceItem<bool>('isPushOn', false);
  static final isPushOnRx = RxPreferenceItem<bool, RxBool>('isPushOn', false);
  static final sliderPosition = RxPreferenceItem<double, RxDouble>('sliderPosition', 0.0);

  // Rx를 사용하는데 기본값이 null이여야 하는 경우 Rxn 사용
  static final birthday = RxnPreferenceItem<DateTime, Rxn<DateTime>>('birthday');
  static final number = RxPreferenceItem<int, RxInt>('number', 0);
}
