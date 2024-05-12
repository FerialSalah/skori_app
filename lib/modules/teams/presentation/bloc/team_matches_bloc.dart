import 'package:bloc/bloc.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class TeamMatchesBloc extends Bloc<TeamEvent, BaseState> {
  final TeamsUseCase teamsUsaCase;
  List<MatchEntity> teamMatches=[];

  TeamMatchesBloc(this.teamsUsaCase) : super(InitState()) {
    on<GetTeamMatches>((event, emit) => _handleGetTeamMatches(event, emit));
  }


  _handleGetTeamMatches(GetTeamMatches event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getTeamMatches(event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      teamMatches=response;
      emit(SuccessState(data: response));
    });
  }


}
