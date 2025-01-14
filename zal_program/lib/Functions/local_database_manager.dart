import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:zal/Functions/Models/computer_data_models.dart';
import 'package:zal/Functions/Models/models.dart';

class LocalDatabaseManager {
  static Future<ComputerSpecs?> loadComputerSpecs() async {
    final box = Hive.box("data");
    if (box.containsKey('computerSpecs')) {
      return ComputerSpecs.fromJson(box.get('computerSpecs')!);
    }
    return null;
  }

  ///used in notifications provider to set the basic notifications.
  static Future<bool> loadIsFirstRun() async {
    final box = Hive.box("data");
    if (box.containsKey('isFirstRun')) {
      return false;
    }
    return true;
  }

  ///used in notifications provider to set the basic notifications.
  static Future<void> saveIsFirstRun() async {
    final box = Hive.box("data");
    await box.put('isFirstRun', false);
  }

  static Future<void> saveComputerSpecs(ComputerSpecs computerSpecs) async {
    final box = Hive.box("data");
    await box.put('computerSpecs', computerSpecs.toJson());
  }

  static Future<Settings?> loadSettings() async {
    final box = Hive.box("data");
    if (box.containsKey("settings")) {
      return Settings.fromJson(box.get("settings")!);
    } 
    return null;
  }

  static Future<List<NotificationData>?> loadNotifications() async {
    final box = Hive.box("data");
    if (box.containsKey('notifications')) {
      List<dynamic> rawNotifications = jsonDecode(box.get('notifications')!);
      List<NotificationData> notifications = [];
      for (final rawNotification in rawNotifications) {
        notifications.add(NotificationData.fromJson(rawNotification));
      }
      return notifications;
    }
    return null;
  }

  static Future<void> saveNotifications(List<NotificationData> notifications) async {
    final box = Hive.box("data");
    await box.put('notifications', jsonEncode(notifications.map((e) => e.toJson()).toList()));
  }
}
