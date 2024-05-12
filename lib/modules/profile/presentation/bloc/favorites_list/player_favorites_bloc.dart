import 'package:bloc/bloc.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'favorites_event.dart';



class FavoritesPlayersBloc extends Bloc<FavoritesEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<PlayerEntity> favoritesPlayers=[];
  int currentPage = 1;
  FavoritesPlayersBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFavoritesPlayersData>((event, emit) => _handleGetFavoritesTeamsData(event, emit));
    on<FavoritesPlayersPagination>((event, emit) => _handleFavoritesTeamPagination(event, emit));

  }

  _handleGetFavoritesTeamsData(GetFavoritesPlayersData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFavoritesPlayers(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      favoritesPlayers=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFavoritesTeamPagination(FavoritesPlayersPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFavoritesPlayers(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        favoritesPlayers.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
