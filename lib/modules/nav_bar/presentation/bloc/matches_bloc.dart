import 'package:bloc/bloc.dart';
import 'package:skori/modules/nav_bar/domain/entity/match_entity.dart';
import 'package:skori/modules/nav_bar/domain/usecase/nav_bar_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'matches_event.dart';


class MatchesBloc extends Bloc<MatchesEvent, BaseState> {
  final NavBarUseCase navBarUsaCase;
  List<MatchEntity> matches=[];
  int currentPage = 1;
   String? tournamentId;
   String? teamId;
   String? countryId;
   String? date="";
   String? seasonId;
  MatchesBloc(this.navBarUsaCase) : super(LoadingState()) {

    on<GetMatchesData>((event, emit) => _handleGetMatchesData(event, emit));
    on<MatchesPagination>((event, emit) => _handleMatchesPagination(event, emit));

  }

  _handleGetMatchesData(GetMatchesData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    print("tour id is :$tournamentId");
    print("season id is : $seasonId");
    final result = await navBarUsaCase.getMatches(page: 1,teamId: teamId,tournamentId: tournamentId,date: date,countryId:countryId,seasonId: seasonId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("matches are:$matches");
      matches=response;
      emit(SuccessState(data: response));
    });
  }

  _handleMatchesPagination(MatchesPagination event, Emitter<BaseState> emit) async {
    print(currentPage);
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await navBarUsaCase.getMatches(page:currentPage,teamId: teamId,tournamentId: tournamentId,date: date,countryId: countryId,seasonId: seasonId);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        matches.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
}
