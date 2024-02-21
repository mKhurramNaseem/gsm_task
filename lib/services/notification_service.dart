

import 'package:gsm_task/services/api_service.dart';

class NotificationService extends ApiService {
  static NotificationService? _instance;
  NotificationService._internal();
  factory NotificationService() {
    return _instance ??= NotificationService._internal();
  }

  @override
  String get apiUrl => '/fcm/send';

  Future<bool> sendNotification(
      {required String title,
      required String body,
      required String message,
      required String token}) async {
    var data = {      
      "to": token,
      "priority": "high",
      "notification": {
        "title": title,
        "body":
            body
      },
      "data": {"type": message, "id": "notification_id"}
    };

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'key=AAAAZQPVDG0:APA91bGKG5AD98g3GTbFameSnJZOGQvlH0mP07B4OkJs_PUJG1vPgxYjBqF502UgCj-hsWYvIpgLXn3KsrKDThimUxy_1ki5Ai8UxyGJm2PZicdr1a0RxQbsRObv_2KuBiY2_BAru0sM',
    };
    bool isSend = await postNotification(body: data, header: header);
    return isSend;
  }
}
