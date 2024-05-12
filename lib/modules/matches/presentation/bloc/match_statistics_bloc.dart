import 'package:bloc/bloc.dart';
import 'package:skori/modules/matches/domain/entity/statistics_entity.dart';
import 'package:skori/modules/matches/domain/usecase/match_statistics_usecase.dart';
import 'package:skori/modules/matches/presentation/bloc/match_statistics_event.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/nav_bar/domain/usecase/nav_bar_usecase.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/news/domain/usecase/news_usecase.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class MatchStatisticsBloc extends Bloc<MatchStatisticsEvent, BaseState> {
  final MatchStatisticsUseCase matchStatisticsUseCase;
  StatisticsEntity? matchStatistics;

  MatchStatisticsBloc(this.matchStatisticsUseCase) : super(LoadingState()) {

    on<GetMatchStatisticsData>((event, emit) => _handleGetMatchStatisticsData(event, emit));

  }

  _handleGetMatchStatisticsData(GetMatchStatisticsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await matchStatisticsUseCase.getMatchStatistics(matchId: event.matchId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("match statistics are:$matchStatistics");
      matchStatistics=response;
      emit(SuccessState(data: response));
    });
  }

}
