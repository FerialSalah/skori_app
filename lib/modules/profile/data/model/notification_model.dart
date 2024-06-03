
import 'package:skori/modules/profile/domain/entity/notification_entity.dart';

class NotificationsModel {
  NotificationsModel({
    required this.data,
  });

  List<NotificationModel> data;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    data: json["data"] == null ? [] : List<NotificationModel>.from(json["data"]!.map((x) => NotificationModel.fromJson(x))),
  );

}



class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    required super.title,
    required super.body,
    required super.date,

  });


  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["notification_id"],
    title: json["title"],
    body: json["body"],
    date: json["created_at"],
  );
}





