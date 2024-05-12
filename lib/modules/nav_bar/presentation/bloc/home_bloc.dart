import 'package:bloc/bloc.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/nav_bar/domain/usecase/nav_bar_usecase.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/home_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'matches_event.dart';


class HomeBloc extends Bloc<HomeEvent, BaseState> {
  final NavBarUseCase navBarUsaCase;
  int currentPage = 1;
  HomeBloc(this.navBarUsaCase) : super(InitState()) {

    on<GetHomeData>((event, emit) => _handleGetMatchesData(event, emit));

  }

  _handleGetMatchesData(GetHomeData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await navBarUsaCase.getHome();
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      emit(SuccessState(data: response));
    });
  }

}
