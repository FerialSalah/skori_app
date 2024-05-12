import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/following_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';



class FollowingPlayersBloc extends Bloc<FollowingEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<PlayerEntity> followingPlayers=[];
  int currentPage = 1;
  FollowingPlayersBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFollowingPlayersData>((event, emit) => _handleGetFollowingTeamsData(event, emit));
    on<FollowingPlayersPagination>((event, emit) => _handleFollowingTeamPagination(event, emit));

  }

  _handleGetFollowingTeamsData(GetFollowingPlayersData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFollowingPlayers(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      followingPlayers=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFollowingTeamPagination(FollowingPlayersPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFollowingPlayers(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        followingPlayers.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
