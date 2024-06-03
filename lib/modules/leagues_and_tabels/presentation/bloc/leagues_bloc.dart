import 'package:bloc/bloc.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'leagues_event.dart';


class LeaguesBloc extends Bloc<LeaguesEvent, BaseState> {
  final LeaguesUseCase leaguesUsaCase;
  List<LeagueEntity> leagues=[];
  int currentPage = 1;
  LeaguesBloc(this.leaguesUsaCase) : super(InitState()) {

    on<GetLeaguesData>((event, emit) => _handleGetLeaguesData(event, emit));
    on<LeaguesPagination>((event, emit) => _handleNPlayersPagination(event, emit));

  }

  _handleGetLeaguesData(GetLeaguesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await leaguesUsaCase.getLeagues(1);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      leagues=response;
      emit(SuccessState(data: response));
    });
  }

  _handleNPlayersPagination(LeaguesPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await leaguesUsaCase.getLeagues(currentPage);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        leagues.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
