import 'package:bloc/bloc.dart';
import 'package:skori/modules/matches/domain/usecase/match_statistics_usecase.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_matches_event.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class RecentAwayMatchesBloc extends Bloc<RecentMatchesEvent, BaseState> {
  final MatchStatisticsUseCase matchStatisticsUseCase;
  List<MatchEntity> recentAwayMatches=[];



  RecentAwayMatchesBloc(this.matchStatisticsUseCase) : super(LoadingState()) {

    on<GetRecentAwayMatchesData>((event, emit) => _handleGetRecentHomeMatchesData(event, emit));


  }

  _handleGetRecentHomeMatchesData(GetRecentAwayMatchesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await matchStatisticsUseCase.getRecentMatches(teamId: event.teamId, matchId: event.matchId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("i am recent");

      recentAwayMatches=response;
      print("home matches are recent:$response");

      emit(SuccessState(data: response));
    });
  }


}
