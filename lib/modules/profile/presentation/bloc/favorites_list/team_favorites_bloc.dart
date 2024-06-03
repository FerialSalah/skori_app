import 'package:bloc/bloc.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'favorites_event.dart';



class FavoritesTeamsBloc extends Bloc<FavoritesEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<TeamEntity> favoritesTeams=[];
  int currentPage = 1;
  FavoritesTeamsBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFavoritesTeamsData>((event, emit) => _handleGetFavoritesTeamsData(event, emit));
    on<FavoritesTeamsPagination>((event, emit) => _handleFavoritesTeamPagination(event, emit));

  }

  _handleGetFavoritesTeamsData(GetFavoritesTeamsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFavoritesTeams(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      favoritesTeams=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFavoritesTeamPagination(FavoritesTeamsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFavoritesTeams(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        favoritesTeams.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
