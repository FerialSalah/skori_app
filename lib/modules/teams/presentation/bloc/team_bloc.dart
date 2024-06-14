import 'package:bloc/bloc.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'team_event.dart';


class TeamsBloc extends Bloc<TeamEvent, BaseState> {
  final TeamsUseCase teamsUsaCase;
  List<TeamEntity> teams=[];
  List<TeamEntity> filterTeams=[];

  int currentPage = 1;
  String? name;
  String? tournamentId;
  String? countryId;
  TeamsBloc(this.teamsUsaCase) : super(InitState()) {

    on<GetTeamsData>((event, emit) => _handleGetTeamsData(event, emit));
    on<TeamsPagination>((event, emit) => _handleTeamPagination(event, emit));
    on<GetFilterTeamsData>((event, emit) => _handleGetFilterTeamsData(event, emit));


  }

  _handleGetTeamsData(GetTeamsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getTeams(page: 1,countryId: countryId,teamName: name,tournamentId: tournamentId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      teams=response;
      emit(SuccessState(data: response));
    });
  }

  _handleTeamPagination(TeamsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await teamsUsaCase.getTeams(page: currentPage,countryId: countryId,teamName: name,tournamentId: tournamentId);
      print("teams pag: $result");
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        teams.addAll(response.reversed);

        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
  _handleGetFilterTeamsData(GetFilterTeamsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getFilterTeams(tournamentId: tournamentId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      filterTeams=response;
      print(filterTeams);
      emit(SuccessState(data: response));
    });
  }

}
