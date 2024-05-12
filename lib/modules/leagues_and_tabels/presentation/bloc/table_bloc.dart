import 'package:bloc/bloc.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/leagues_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/entity/table_entity.dart';
import 'package:skori/modules/leagues_and_tabels/domain/usecase/leagues_usecase.dart';
import '../../../../../core/errors/faliure.dart';
import '../../../../core/state/base_state.dart';
import 'leagues_event.dart';


class TableBloc extends Bloc<LeaguesEvent, BaseState> {
  final LeaguesUseCase leaguesUsaCase;
  List<TableEntity> table=[];
  TableBloc(this.leaguesUsaCase) : super(InitState()) {

    on<GetTableData>((event, emit) => _handleGetTableData(event, emit));

  }

  _handleGetTableData(GetTableData event, Emitter<BaseState> emit) async {
    emit(LoadingState());
    final result = await leaguesUsaCase.getTable(event.id);
    result.fold((failure) {
      if (failure is FailureOffline) {
        emit(OfflineState(
            msg:"connection network unstable , please try agin after check connection"));
      } else if (failure is FailureServiceWithResponse) {
        emit(ErrorState(msg: failure.msg));
      }
    }, (response) {
      table=response;
      emit(SuccessState(data: response));
    });
  }

}
