import 'package:bloc/bloc.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import 'package:skori/modules/teams/domain/usecase/team_usecase.dart';
import 'package:skori/modules/teams/presentation/bloc/team_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'leagues_event.dart';


class LeagueNewsBloc extends Bloc<LeaguesEvent, BaseState> {
  final LeaguesUseCase leaguesUseCase;
  List<NewsEntity> leagueNews =[];
  int currentPage = 1;


  LeagueNewsBloc(this.leaguesUseCase) : super(InitState()) {

    on<GetLeagueNews>((event, emit) => _handleGetLeagueNews(event, emit));
    on<LeagueNewsPagination>((event, emit) => _handleLeagueNewsPagination(event, emit));
  }


  _handleGetLeagueNews(GetLeagueNews event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await leaguesUseCase.getLeagueNews(currentPage,event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        print("league news error:${failure.msg}");
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      print("league news response:${response}");
      leagueNews = response;
      emit(SuccessState(data: response));
    });
  }

  _handleLeagueNewsPagination(LeagueNewsPagination event, Emitter<BaseState> emit) async {
    print("current page in leagueNews:$currentPage");
    if (state is PaginateState) return;
    try {
      emit(PaginateState());
      currentPage++;
      final result = await leaguesUseCase.getLeagueNews( currentPage,event.id);
      result.fold((failure) {
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        leagueNews.addAll(response.reversed);
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }

}
