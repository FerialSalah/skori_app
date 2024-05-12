import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/news/domain/usecase/news_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'news_event.dart';


class InterviewNewsBloc extends Bloc<NewsEvent, BaseState> {
  final NewsUseCase newsUsaCase;
  List<NewsEntity> interviewNews=[];
  int currentPage = 1;
  InterviewNewsBloc(this.newsUsaCase) : super(InitState()) {

    on<GetInterviewNewsData>((event, emit) => _handleGetNewsData(event, emit));
    on<InterviewNewsPagination>((event, emit) => _handleNewsPagination(event, emit));

  }

  _handleGetNewsData(GetInterviewNewsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await newsUsaCase.getNews(page: 1,type:"interview");
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      interviewNews=response;
      emit(SuccessState(data: response));
    });
  }

  _handleNewsPagination(InterviewNewsPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await newsUsaCase.getNews(page: currentPage,type: "interview");
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        interviewNews.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
