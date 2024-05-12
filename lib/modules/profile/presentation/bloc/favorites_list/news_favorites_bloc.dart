// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skori/core/errors/faliure.dart';
// import 'package:skori/core/state/base_state.dart';
// import 'package:skori/modules/profile/domain/usecase/profile_usecase.dart';
// import 'package:skori/modules/profile/presentation/bloc/favorites_list/favorites_event.dart';
//
// import '../../../../news/domain/entity/news_entity.dart';
//
// class FavoritesPlayersBloc extends Bloc<FavoritesEvent, BaseState> {
//   final ProfileUseCase profileUsaCase;
//   List<NewsEntity> favoritesNews=[];
//   int currentPage = 1;
//   FavoritesPlayersBloc(this.profileUsaCase) : super(InitState()) {
//
//     on<GetFavoritesPlayersData>((event, emit) => _handleGetFavoritesNewsData(event, emit));
//     on<FavoritesPlayersPagination>((event, emit) => _handleFavoritesNewsPagination(event, emit));
//
//   }
//
//   _handleGetFavoritesNewsData(GetFavoritesNewsData event, Emitter<BaseState> emit) async {
//     emit(LoadingState());
//     final result = await profileUsaCase.getFavoritesPlayers(1);
//     result.fold((failure) {
//       if (failure is FailureOffline) {
//         emit(OfflineState(
//             msg:"connection network unstable , please try agin after check connection"));
//       } else if (failure is FailureServiceWithResponse) {
//         emit(ErrorState(msg: failure.msg));
//       }
//     }, (response) {
//       favoritesNews=response;
//       emit(SuccessState(data: response));
//     });
//   }
//
//   _handleFavoritesNewsPagination(FavoritesPlayersPagination event, Emitter<BaseState> emit) async {
//     print(currentPage);
//     if (state is PaginateState) return;
//     try {
//       emit(PaginateState());
//       currentPage++;
//       final result = await profileUsaCase.getFavoritesPlayers(currentPage);
//       result.fold((failure) {
//         currentPage--;
//       }, (response) {
//         if (response.reversed.isEmpty) currentPage--;
//         favoritesNews.addAll(response.reversed);
//         emit(SuccessState(data: response));
//       });
//     } catch (e) {
//       currentPage--;
//     }
//   }
// }
