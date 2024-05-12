import 'package:bloc/bloc.dart';

import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../leagues_and_tabels/domain/entity/leagues_entity.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'following_event.dart';



class FollowingLeaguesBloc extends Bloc<FollowingEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<LeagueEntity> followingLeagues=[];
  int currentPage = 1;
  FollowingLeaguesBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFollowingLeaguesData>((event, emit) => _handleGetFollowingTeamsData(event, emit));
    on<FollowingLeaguesPagination>((event, emit) => _handleFollowingTeamPagination(event, emit));

  }

  _handleGetFollowingTeamsData(GetFollowingLeaguesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFollowingLeagues(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      followingLeagues=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFollowingTeamPagination(FollowingLeaguesPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFollowingLeagues(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        followingLeagues.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
