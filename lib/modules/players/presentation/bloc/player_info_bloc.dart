import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class PlayerInfoBloc extends Bloc<PlayersEvent, BaseState> {
  final PlayersUseCase playersUsaCase;
  PlayerEntity? playerEntity;

  PlayerInfoBloc(this.playersUsaCase) : super(InitState()) {
    on<GetPlayerInfo>((event, emit) => _handleNPlayerInfo(event, emit));
  }

  _handleNPlayerInfo(GetPlayerInfo event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await playersUsaCase.getPlayerInfo(id:event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      playerEntity=response;
      emit(SuccessState(data: response));
    });

}
}
