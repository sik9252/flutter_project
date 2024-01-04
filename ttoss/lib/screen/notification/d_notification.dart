import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:fast_app_base/screen/notification/w_notification_item.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:nav/enum/enum_nav_ani.dart';

import 'w_selected_notification.dart';

class NotificationDialog extends DialogWidget {
  final TtossNotification selectedNotification;

  NotificationDialog({
    super.key,
    super.animation = NavAni.Bottom,
    //super.barrierDismissible = false,
    required this.selectedNotification,
  });

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

// state 클래스 안에서는 widget. 이라는 프로퍼티를 통해 StatefulWidget의 인스턴스 변수에 접근
class _NotificationDialogState extends DialogState<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SelectedNotificationWidget(
            notificaiton: widget.selectedNotification,
            //onTap: () => widget.hide(),
          ),
        ],
      ),
    );
  }
}
