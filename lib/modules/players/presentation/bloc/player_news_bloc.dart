import 'package:bloc/bloc.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/players/domain/entity/player_entity.dart';
import 'package:skori/modules/players/domain/usecase/player_usecase.dart';
import 'package:skori/modules/players/presentation/bloc/players_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class PlayerNewsBloc extends Bloc<PlayersEvent, BaseState> {
  final PlayersUseCase playersUsaCase;
  List<NewsEntity>? playerNews;

  PlayerNewsBloc(this.playersUsaCase) : super(InitState()) {
    on<GetPlayerNews>((event, emit) => _handlePlayerNews(event, emit));
  }

_handlePlayerNews(GetPlayerNews event, Emitter<BaseState> emit) async {
  emit(LoadingState());
  final result = await playersUsaCase.getPlayerNews(event.id);
  result.fold((failure) {
    if (failure is FailureOffline) {
      emit(OfflineState(
          msg:"connection network unstable , please try agin after check connection"));
    } else if (failure is FailureServiceWithResponse) {
      emit(ErrorState(msg: failure.msg));
    }
  }, (response) {
    playerNews = response;
    emit(SuccessState(data: response));
  });
}
}
