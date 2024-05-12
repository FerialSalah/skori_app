import 'package:bloc/bloc.dart';

import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../../leagues_and_tabels/domain/entity/leagues_entity.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'favorites_event.dart';



class FavoritesLeaguesBloc extends Bloc<FavoritesEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<LeagueEntity> favoritesLeagues=[];
  int currentPage = 1;
  FavoritesLeaguesBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFavoritesLeaguesData>((event, emit) => _handleGetFollowingTeamsData(event, emit));
    on<FavoritesLeaguesPagination>((event, emit) => _handleFollowingTeamPagination(event, emit));

  }

  _handleGetFollowingTeamsData(GetFavoritesLeaguesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFavoritesLeagues(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      favoritesLeagues=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFollowingTeamPagination(FavoritesLeaguesPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFavoritesLeagues(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        favoritesLeagues.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
