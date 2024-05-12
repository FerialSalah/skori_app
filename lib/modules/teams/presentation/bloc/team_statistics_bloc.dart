import 'package:bloc/bloc.dart';
import 'package:skori/modules/teams/domain/entity/team_statistics_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class TeamStatisticsBloc extends Bloc<TeamEvent, BaseState> {
  final TeamsUseCase teamsUsaCase;
  TeamStatisticsEntity? teamStatistics;
  TeamStatisticsBloc(this.teamsUsaCase) : super(InitState()) {

    on<GetTeamStatistics>((event, emit) => _handleGetTeamStatistics(event, emit));

  }


  _handleGetTeamStatistics(GetTeamStatistics event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getTeamStatistics(event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      teamStatistics=response;
      emit(SuccessState(data: response));
    });
  }

}
