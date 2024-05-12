import 'package:bloc/bloc.dart';
import 'package:skori/modules/search/domain/usecase/search_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import '../../domain/entity/search_entity.dart';
import 'search_event.dart';


class SearchBloc extends Bloc<SearchEvent, BaseState> {
  final SearchUseCase searchUsaCase;
  SearchEntity? searchEntity;
  String type = "all";
  String? key;
  SearchBloc(this.searchUsaCase) : super(InitState()){
    on<GetSearch>((event, emit) => _handleGetSearchData(event, emit));
  }

  _handleGetSearchData(GetSearch event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await searchUsaCase.getSearch(type: type,key: key!);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      searchEntity=response;
      emit(SuccessState(data: response));
    });
  }

}
