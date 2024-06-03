import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/entity/team_entity.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../../core/state/base_state.dart';
import '../../../domain/usecase/profile_usecase.dart';
import 'favorites_event.dart';



class FavoritesNewsBloc extends Bloc<FavoritesEvent, BaseState> {
  final ProfileUseCase profileUsaCase;
  List<NewsEntity> favoritesNews=[];
  int currentPage = 1;
  FavoritesNewsBloc(this.profileUsaCase) : super(InitState()) {

    on<GetFavoritesNewsData>((event, emit) => _handleGetFavoritesNewsData(event, emit));
    on<FavoritesNewsPagination>((event, emit) => _handleFavoritesNewsPagination(event, emit));

  }

  _handleGetFavoritesNewsData(GetFavoritesNewsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await profileUsaCase.getFavoritesNews(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      favoritesNews=response;
      emit(SuccessState(data: response));
    });
  }

  _handleFavoritesNewsPagination(FavoritesNewsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await profileUsaCase.getFavoritesNews(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        favoritesNews.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
