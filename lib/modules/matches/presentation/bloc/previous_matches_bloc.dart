import 'package:bloc/bloc.dart';
import 'package:skori/modules/matches/domain/usecase/match_statistics_usecase.dart';
import 'package:skori/modules/matches/presentation/bloc/recent_matches_event.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class PreviousMatchesBloc extends Bloc<RecentMatchesEvent, BaseState> {
  final MatchStatisticsUseCase matchStatisticsUseCase;

  List<MatchEntity> previousMatches=[];


  PreviousMatchesBloc(this.matchStatisticsUseCase) : super(LoadingState()) {



    on<GetPreviousMatchesData>((event, emit) => _handleGetPreviousMatchesData(event, emit));

  }

  _handleGetPreviousMatchesData(GetPreviousMatchesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await matchStatisticsUseCase.getPreviousMatches(homeTeamId: event.homeTeamId, awayTeamId: event.awayTeamId, matchId: event.matchId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("data :$response");
      print("i am here");
      previousMatches=response;
      print("matches previous are:$previousMatches");

      emit(SuccessState(data: response));
    });
  }


}
