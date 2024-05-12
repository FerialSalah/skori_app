import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entity/player_new_statistics_entity.dart';
import '../../domain/entity/player_statistics_entity.dart';


class PlayerStatisticsBloc extends Bloc<PlayersEvent, BaseState> {
  final PlayersUseCase playersUsaCase;
  PlayerStatisticsEntity? playerStatisticsEntity;
  PlayerNewStatisticsEntity? playerNewStatisticsEntity;
  String? tournamentId;
  String? seasonId;

  PlayerStatisticsBloc(this.playersUsaCase) : super(InitState()) {
    // on<GetPlayerStatistics>((event, emit) => _handlePlayerStatistics(event, emit));
     on<GetPlayerNewStatistics>((event, emit) => _handlePlayerNewStatistics(event, emit));

  }


_handlePlayerStatistics(GetPlayerStatistics event, Emitter<BaseState> emit) async {
  emit(LoadingState());
  final result = await playersUsaCase.getPlayerStatistics(event.id);
  result.fold((failure) {
    if (failure is FailureOffline) {
      emit(OfflineState(
          msg:"connection network unstable , please try agin after check connection"));
    } else if (failure is FailureServiceWithResponse) {
      emit(ErrorState(msg: failure.msg));
    }
  }, (response) {
    playerStatisticsEntity=response;
    emit(SuccessState(data: response));
  });
}
  _handlePlayerNewStatistics(GetPlayerNewStatistics event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await playersUsaCase.getPlayerNewStatistics(event.id,tournamentId,seasonId);
    print("rrrrrrrrrrr:$result");
    print("hereeee");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      playerNewStatisticsEntity=response;

      emit(SuccessState(data: response));
    });
  }

}
