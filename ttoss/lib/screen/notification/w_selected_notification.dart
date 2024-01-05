import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../common/common.dart';

class SelectedNotificationWidget extends StatefulWidget {
  final TtossNotification notificaiton;
  final VoidCallback? onTap;

  const SelectedNotificationWidget(
      {required this.notificaiton, this.onTap, super.key});

  @override
  State<SelectedNotificationWidget> createState() =>
      _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<SelectedNotificationWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.only(top:15, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: widget.notificaiton.isRead
              ? context.backgroundColor
              : context.appColors.unreadColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Width(leftPadding),
                Image.asset(widget.notificaiton.type.iconPath,
                    width: iconWidth),
                widget.notificaiton.type.name.text
                    .size(12)
                    .color(context.appColors.lessImportant)
                    .make(),
                emptyExpanded,
                timeago
                    .format(widget.notificaiton.time,
                        locale: context.locale.languageCode)
                    .text
                    .size(13)
                    .color(context.appColors.lessImportant)
                    .make(),
                const Width(leftPadding),
              ],
            ),
            widget.notificaiton.description.text
                .make()
                .pOnly(left: leftPadding + iconWidth)
          ],
        ),
      ),
    );
  }
}
