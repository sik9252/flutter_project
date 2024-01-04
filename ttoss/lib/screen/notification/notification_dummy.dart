import 'package:fast_app_base/common/dart/extension/num_duration_extension.dart';
import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';

import 'vo/notification_type.dart';

final notificationDummies = <TtossNotification>[
  TtossNotification(NotificationType.tossPay,
      '이번주에 영화 한편 어때요? CGV 할인 쿠폰이 도착했어요.', DateTime.now().subtract(27.minutes),
      isRead: true),
  TtossNotification(
    NotificationType.moneyTip,
    '띵동! 일요일 공동구매 보러가기.',
    DateTime.now().subtract(1.minutes),
  ),
  TtossNotification(NotificationType.stock, '이번주에 영화 한편 어때요? CGV 할인 쿠폰이 도착했어요.',
      DateTime.now().subtract(8.hours),
      isRead: true),
  TtossNotification(NotificationType.moneyTip,
      '유럽 식품 물가가 치솟고 있어요.\n관심있다면 확인해보세요.', DateTime.now().subtract(30.seconds),
      isRead: true),
  TtossNotification(
    NotificationType.luck,
    '1월 1일, 행운 복권이 도착했어요.',
    DateTime.now().subtract(1.days),
  ),
  TtossNotification(
    NotificationType.walk,
    '오늘 1000걸음을 넘겼어요. 포인트를 받아보세요.',
    DateTime.now().subtract(27.minutes),
  ),
];
