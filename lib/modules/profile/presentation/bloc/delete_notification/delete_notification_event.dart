abstract class DeleteNotificationEvent  {
  const DeleteNotificationEvent();

  @override
  List<Object> get props => [];
}

class DeleteNotificationCall extends DeleteNotificationEvent {
  final String id;


  DeleteNotificationCall( { required this.id,} );
}