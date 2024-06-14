import 'package:bloc/bloc.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'leagues_event.dart';

class LeagueDisciplineBloc extends Bloc<LeaguesEvent, BaseState> {
  final LeaguesUseCase leaguesUseCase;
  List<LeagueDisciplineEntity> leagueDiscipline = [];
  String? seasonId;

  LeagueDisciplineBloc(this.leaguesUseCase) : super(InitState()) {
    on<GetLeagueDiscipline>(
        (event, emit) => _handleGetLeagueDiscipline(event, emit));
  }

  _handleGetLeagueDiscipline(
      GetLeagueDiscipline event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result =
        await leaguesUseCase.getLeagueDisciplines(event.id, seasonId??"");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:
                "connection network unstable , please try again after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        print("league news error:${failure.msg}");
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("league discipline response:${response}");
      leagueDiscipline = response;
      emit(SuccessState(data: response));
    });
  }
}
