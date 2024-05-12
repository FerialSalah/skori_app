
import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {

  final String id;
  final String title;
  final String body;
  final String date;






  NotificationEntity(
      {
        required this.id,
        required this.title,
        required this.body,
        required this.date,

      });
  @override
  List<Object?> get props => [];

}