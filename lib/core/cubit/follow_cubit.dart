import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/leagues_following_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/team_following_bloc.dart';
import '../../../core/dio_helper/dio_helper.dart';
import '../../../core/network/urls_app.dart';
import '../../../core/state/base_state.dart';
import '../../../core/widgets/snack_bar.dart';
import '../../modules/profile/presentation/bloc/following_list/following_event.dart';
import '../../modules/profile/presentation/bloc/following_list/player_follwing_bloc.dart';
import '../network/network_checker.dart';

class FollowCubit extends Cubit<BaseState> {
  FollowCubit(this.networkChecker) : super(InitState());

  static FollowCubit of(context) => BlocProvider.of(context);

  NetworkChecker networkChecker;
  Future<void> toggleFollow({required int id,required String type}) async {
    print("Follllow");
    print(id);
    print(type);
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      final body = {
        'model_id': id,
        'model_type': type};
      try {
        final r = await DioHelper.post(TOGGLE_FOLLOW, body: body);
        if (r.statusCode == 200 || r.statusCode == 201) {
          print("===================");
          print(r.data);
          emit(SuccessState());
          BlocProvider.of<FollowingTeamsBloc>(RouteManager.currentContext)..add(GetFollowingTeamsData());
          BlocProvider.of<FollowingPlayersBloc>(RouteManager.currentContext)..add(GetFollowingPlayersData());
          BlocProvider.of<FollowingLeaguesBloc>(RouteManager.currentContext)..add(GetFollowingLeaguesData());
        } else {
          emit(ErrorState(msg: ""));
        }
      } catch (e, s) {
        print(s);
        showSnackBar(e.toString());
        emit(ErrorState(msg: ''));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }
}
