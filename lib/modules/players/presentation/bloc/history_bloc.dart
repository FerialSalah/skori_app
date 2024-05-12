import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entity/player_history_entity.dart';


class PlayerHistoryBloc extends Bloc<PlayersEvent, BaseState> {
  final PlayersUseCase playersUsaCase;
  List<PlayerHistoryEntity>? playerHistory;

  PlayerHistoryBloc(this.playersUsaCase) : super(InitState()) {
    on<GetPlayerHistory>((event, emit) => _handlePlayerHistory(event, emit));
  }


_handlePlayerHistory(GetPlayerHistory event, Emitter<BaseState> emit) async {
  emit(LoadingState());
  final result = await playersUsaCase.getPlayerHistory(event.id);
  result.fold((failure) {
    if (failure is FailureOffline) {
      emit(OfflineState(
          msg:"connection network unstable , please try agin after check connection"));
    } else if (failure is FailureServiceWithResponse) {
      emit(ErrorState(msg: failure.msg));
    }
  }, (response) {
    playerHistory = response;
    emit(SuccessState(data: response));
  });
}

}
