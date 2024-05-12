import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class TeamNewsBloc extends Bloc<TeamEvent, BaseState> {
  final TeamsUseCase teamsUsaCase;
  List<NewsEntity> teamNews =[];

  TeamNewsBloc(this.teamsUsaCase) : super(InitState()) {

    on<GetTeamNews>((event, emit) => _handleGetTeamNews(event, emit));
  }


  _handleGetTeamNews(GetTeamNews event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await teamsUsaCase.getTeamNews(event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      teamNews = response;
      emit(SuccessState(data: response));
    });
  }


}
