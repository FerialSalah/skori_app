import 'package:bloc/bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/following_event.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';



class FollowingTeamsBloc extends Bloc<FollowingEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<TeamEntity> followingTeams=[];
  int currentPage = 1;
  FollowingTeamsBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFollowingTeamsData>((event, emit) => _handleGetFollowingTeamsData(event, emit));
    on<FollowingTeamsPagination>((event, emit) => _handleFollowingTeamPagination(event, emit));

  }

  _handleGetFollowingTeamsData(GetFollowingTeamsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFollowingTeams(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      followingTeams=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFollowingTeamPagination(FollowingTeamsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFollowingTeams(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        followingTeams.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
