import 'package:fast_app_base/screen/notification/vo/vo_notification.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../common/common.dart';

class NotificationItemWidget extends StatefulWidget {
  final TtossNotification notificaiton;
  final VoidCallback? onTap;

  const NotificationItemWidget(
      {required this.notificaiton, this.onTap, super.key});

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget> {
  static const double leftPadding = 10;
  static const double iconWidth = 25;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: widget.notificaiton.isRead
            ? context.backgroundColor
            : context.appColors.unreadColor,
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
                    .color(context.appColors.lessImportatText)
                    .make(),
                emptyExpanded,
                timeago
                    .format(widget.notificaiton.time,
                        locale: context.locale.languageCode)
                    .text
                    .size(13)
                    .color(context.appColors.lessImportatText)
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
