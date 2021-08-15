import 'package:flutter/material.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/model/allModel.dart';

class SingleNotification extends StatelessWidget {
  final LPNotification notification;
  const SingleNotification(this.notification, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.format_quote,
          size: notificationIconSize,
          color: iconColor,
        ),
        Expanded(
          child: Text(
            notification.text,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
