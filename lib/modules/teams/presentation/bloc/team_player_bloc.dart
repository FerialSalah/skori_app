import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class TeamPlayersBloc extends Bloc<TeamEvent, BaseState> {
  final TeamsUseCase teamsUsaCase;
  List<PlayerEntity> teamPlayers=[];
  int currentPage = 1;

  TeamPlayersBloc(this.teamsUsaCase) : super(InitState()) {

    on<GetTeamPlayers>((event, emit) => _handleGetTeamPlayers(event, emit));
    on<TeamPlayersPagination>((event, emit) => _handleTeamPlayersPagination(event, emit));
  }

  _handleGetTeamPlayers(GetTeamPlayers event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getTeamPlayers(1,event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      teamPlayers=response;
      emit(SuccessState(data: response));
    });
  }

  _handleTeamPlayersPagination(TeamPlayersPagination event, Emitter<BaseState> emit) async {
    print("current page in teamplayers:$currentPage");
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await teamsUsaCase.getTeamPlayers( currentPage,event.id);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        teamPlayers.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }

}
