import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/components/notifications/singleNotifications.dart';
import 'package:learning_people/model/allModel.dart';

class Notifications extends StatefulWidget {
  final List<LPNotification> notificationList;
  const Notifications(this.notificationList, {Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool showNotification = false;
  @override
  Widget build(BuildContext context) {
    TextStyle normalText =
        Theme.of(context).textTheme.headline6.copyWith(color: primaryColor);
    TextStyle highlightedText =
        Theme.of(context).textTheme.headline6.copyWith(color: iconColor);
    return Card(
      margin: marginCards,
      child: Container(
        padding: paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Notifications', Icons.mark_chat_unread_outlined),
            Text.rich(
              TextSpan(
                text: 'New Message from ',
                style: normalText,
                children: [
                  TextSpan(text: 'Juliam O\'Donovan', style: highlightedText)
                ],
              ),
            ),
            InkWell(
              onTap: ()=>setState(()=>showNotification = !showNotification),
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                color: iconColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Open Message',
                      style: normalText.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CircularIcon(
                      showNotification?Icons.arrow_back_ios_rounded: Icons.arrow_forward_ios_rounded,
                      radius: 24,
                      backgroundColor: Colors.grey.withOpacity(0.20),
                      iconsColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            if(showNotification) ...widget.notificationList.map((notification)=> SingleNotification(notification)).toList(),
            Buttons('View All', null),
          ],
        ),
      ),
    );
  }
}
