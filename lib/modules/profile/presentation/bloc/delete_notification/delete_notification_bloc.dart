import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/delete_notification/delete_notification_event.dart';
import 'package:skori/modules/profile/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/notifications/notifications_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/routes/navigator_push.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';



class DeleteNotificationBloc extends Bloc<DeleteNotificationEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  DeleteNotificationBloc(this.profileUsaCase) : super(InitState()) {

    on<DeleteNotificationCall>((event, emit) => _handleDeleteNotification(event, emit));

  }

  _handleDeleteNotification(DeleteNotificationCall event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.deleteNotification(id: event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("delete notifi response");
      emit(SuccessState(data: response));
      BlocProvider.of<NotificationsBloc>(RouteManager.currentContext)..add(GetNotificationsData());

    });
  }

}
