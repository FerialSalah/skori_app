import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}


class GetNotificationsData extends NotificationsEvent {
  GetNotificationsData();
}

class DeleteNotification extends NotificationsEvent {
  DeleteNotification();
}