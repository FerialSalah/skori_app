
import 'package:bloc/bloc.dart';

import 'package:skori/modules/transfers/domain/entity/transfer_entity.dart';
import 'package:skori/modules/transfers/domain/usecase/transfer_usecase.dart';
import 'package:skori/modules/transfers/presentaion/bloc/transfers_event.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';


class TransfersBloc extends Bloc<TransfersEvent, BaseState> {
  final TransfersUseCase transfersUseCase;
  List<TransferEntity> transfers=[];

  int currentPage = 1;
  String? playerName;
  String? teamName;
  String? tournamentId;
  String? teamId;
  String? playerId;
  String? seasonId;
  TransfersBloc(this.transfersUseCase) : super(InitState()) {

    on<GetTransfersData>((event, emit) => _handleGetTransfersData(event, emit));
    on<TransfersPagination>((event, emit) => _handleTransfersPagination(event, emit));
   // on<GetFilterTeamsData>((event, emit) => _handleGetFilterTeamsData(event, emit));


  }

  _handleGetTransfersData(GetTransfersData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await transfersUseCase.getTransfers(page: currentPage,seasonId: seasonId,teamName: teamName,tournamentId: tournamentId,
        playerName: playerName,playerId: playerId,teamId: teamId);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {

        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      transfers=response;
      emit(SuccessState(data: response));
    });
  }

  _handleTransfersPagination(TransfersPagination event, Emitter<BaseState> emit) async {
    print("Current page:$currentPage");
    if (state is PaginateState) return;
    try {
        print("i am try");
      emit(PaginateState());
      currentPage++;
      print("current page:$currentPage");
      final result = await transfersUseCase.getTransfers(page:currentPage,seasonId: seasonId,teamName: teamName,tournamentId: tournamentId,
      playerName: playerName,playerId: playerId,teamId: teamId);
      print("pagenation:$result");
      result.fold((failure) {
        print("fail:$failure");
        currentPage--;
      }, (response) {
        if (response.reversed.isEmpty) currentPage--;
        transfers.addAll(response.reversed);
        print("players list length ====${transfers.length}");
        emit(SuccessState(data: response));
      });
    } catch (e) {
      currentPage--;
    }
  }
  // _handleGetFilterTeamsData(GetFilterTeamsData event, Emitter<BaseState> emit) async {
  //   emit(LoadingState());
  //   final result = await teamsUsaCase.getFilterTeams(tournamentId: tournamentId);
  //   result.fold((failure) {
  //     if (failure is FailureOffline) {
  //       emit(OfflineState(
  //           msg:"connection network unstable , please try agin after check connection"));
  //     } else if (failure is FailureServiceWithResponse) {
  //       emit(ErrorState(msg: failure.msg));
  //     }
  //   }, (response) {
  //     filterTeams=response;
  //     print(filterTeams);
  //     emit(SuccessState(data: response));
  //   });
  // }

}
