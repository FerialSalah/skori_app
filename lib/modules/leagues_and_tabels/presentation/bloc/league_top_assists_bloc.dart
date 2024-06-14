import 'package:bloc/bloc.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_discipline_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_performance_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/league_top_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'leagues_event.dart';

class LeagueTopAssistsBloc extends Bloc<LeaguesEvent, BaseState> {
  final LeaguesUseCase leaguesUseCase;
  List<LeagueTopEntity> leagueTopAssists = [];
  String? seasonId;

  LeagueTopAssistsBloc(this.leaguesUseCase) : super(InitState()) {
    on<GetLeagueTopAssists>(
            (event, emit) => _handleGetLeagueTopAssists(event, emit));
  }

  _handleGetLeagueTopAssists(
      GetLeagueTopAssists event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result =
    await leaguesUseCase.getLeagueTopAssists(event.id, seasonId??"");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:
            "connection network unstable , please try again after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        print("league top scores error:${failure.msg}");
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("league performance response:${response}");
      leagueTopAssists = response;
      emit(SuccessState(data: response));
    });
  }
}
