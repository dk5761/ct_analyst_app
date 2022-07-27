import 'package:local_notifier/local_notifier.dart';
import '../utils/functions.dart';

LocalNotification notificationHandler() {
  LocalNotification notification = LocalNotification(
    title: "Please fill the Spine HRMS",
    subtitle: "Daily Task",
    body: "click to open Spine HRMS",
  );

  notification.onClick = () {
    launchURL(
        "http://172.16.1.118/SpineHRMS/login.aspx?ReturnUrl=%2fspinehrms%2fAtten%2fSwipeRequestList.aspx%3fmnusr%3dmenu__10201&mnusr=menu__10201");
  };

  return notification;
}
