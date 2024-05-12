import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/profile/domain/entity/notification_entity.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/following_event.dart';
import 'package:skori/modules/profile/presentation/bloc/notifications/notifications_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';



class NotificationsBloc extends Bloc<NotificationsEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<NotificationEntity> notifications=[];

  NotificationsBloc(this.profileUsaCase) : super(InitState()) {

    on<GetNotificationsData>((event, emit) => _handleGetNotificationsData(event, emit));

  }

  _handleGetNotificationsData(GetNotificationsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getNotifications();
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      notifications=response;
      emit(SuccessState(data: response));
    });
  }

}
