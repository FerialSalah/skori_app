import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'players_event.dart';


class PlayersBloc extends Bloc<PlayersEvent, BaseState> {
  final PlayersUseCase playersUsaCase;
  List<PlayerEntity> players=[];
  int currentPage = 1;
  String? playerName;
  String? countryId;
  String? teamId;
  PlayersBloc(this.playersUsaCase) : super(InitState()) {
    on<GetPlayersData>((event, emit) => _handleGetPlayersData(event, emit));
    on<PlayersPagination>((event, emit) => _handleNPlayersPagination(event, emit));
  }

  _handleGetPlayersData(GetPlayersData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await playersUsaCase.getPlayers(page:1,playerName: playerName,teamId: teamId,
    countryId: countryId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      players=response;
      emit(SuccessState(data: response));
    });
  }

  _handleNPlayersPagination(PlayersPagination event, Emitter<BaseState> emit) async {
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await playersUsaCase.getPlayers(page: currentPage,
          playerName: playerName,teamId: teamId,
          countryId: countryId);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) {
          currentPage--;
          print("currentPage=======$currentPage");
          print(response.reversed);
        }else{
          print(" with data currentPage=======$currentPage");
          print("response.reversed ====${response.reversed}");

          players.addAll(response.reversed);
          print("players list length ====${players.length}");
        }
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }

}
