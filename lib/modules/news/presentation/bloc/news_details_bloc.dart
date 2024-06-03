import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/news/domain/usecase/news_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'news_event.dart';


class NewsDetailsBloc extends Bloc<NewsEvent, BaseState> {
  final NewsUseCase newsUsaCase;
  NewsEntity? newsDetails;
  NewsDetailsBloc(this.newsUsaCase) : super(InitState()) {

    on<GetNewsDetailsData>((event, emit) => _handleGetNewsData(event, emit));

  }

  _handleGetNewsData(GetNewsDetailsData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await newsUsaCase.getNewsDetails(articleId: event.articleId,playerId: event.playerId,teamId: event.teamId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        print(failure.msg);
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      newsDetails=response;
      emit(SuccessState(data: response));
    });
  }

}
