class LPNotification {
  final String text;
  final NotificationAction action;
  LPNotification(this.text, this.action);
}

enum NotificationAction { unread, recieved, read, reacted }

List<LPNotification> dummyNotificationData = [
  LPNotification(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean in arcu tincidunt, suscipit nisl at, suscipit libero. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam congue placerat tellus et accumsan. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent accumsan eros consequat placerat lacinia. Aenean porttitor urna at dictum pulvinar. Sed vel metus ut augue tincidunt facilisis nec ac orci. Donec non viverra massa, vel faucibus leo. Duis sed leo sit amet sapien egestas lobortis ac ut enim. Nunc',
      NotificationAction.reacted)
];
