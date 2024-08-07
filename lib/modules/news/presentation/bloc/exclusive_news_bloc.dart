import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/news/domain/usecase/news_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'news_event.dart';


class ExclusiveNewsBloc extends Bloc<NewsEvent, BaseState> {
  final NewsUseCase newsUsaCase;
  List<NewsEntity> exclusiveNews=[];
  int currentPage = 1;
  ExclusiveNewsBloc(this.newsUsaCase) : super(InitState()) {

    on<GetExclusiveNewsData>((event, emit) => _handleGetNewsData(event, emit));
    on<ExclusiveNewsPagination>((event, emit) => _handleNewsPagination(event, emit));

  }

  _handleGetNewsData(GetExclusiveNewsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await newsUsaCase.getNews(page: 1,type:"exclusive");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      exclusiveNews=response;
      emit(SuccessState(data: response));
    });
  }

  _handleNewsPagination(ExclusiveNewsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await newsUsaCase.getNews(page: currentPage,type: "exclusive");
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        exclusiveNews.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
