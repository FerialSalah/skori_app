import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/news_favorite_bloc.dart';
import 'package:skori/modules/profile/presentation/bloc/favorites_list/team_favorites_bloc.dart';
import '../../../core/dio_helper/dio_helper.dart';
import '../../../core/network/urls_app.dart';
import '../../../core/state/base_state.dart';
import '../../../core/widgets/snack_bar.dart';
import '../../modules/profile/presentation/bloc/favorites_list/favorites_event.dart';
import '../../modules/profile/presentation/bloc/favorites_list/leagues_favourits_bloc.dart';
import '../../modules/profile/presentation/bloc/favorites_list/player_favorites_bloc.dart';
import '../network/network_checker.dart';
import '../routes/navigator_push.dart';

class FavoriteCubit extends Cubit<BaseState> {
  FavoriteCubit(this.networkChecker) : super(InitState());

  static FavoriteCubit of(context) => BlocProvider.of(context);

  NetworkChecker networkChecker;
  Future<void> toggleFavorite({required int id,required String type}) async {
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      final body = {
        'model_id': id,
        'model_type': type};
      try {
        final r = await DioHelper.post(TOGGLE_FAVORITE, body: body);
        if (r.statusCode == 200 || r.statusCode == 201) {
          emit(SuccessState());
          BlocProvider.of<FavoritesTeamsBloc>(RouteManager.currentContext)..add(GetFavoritesTeamsData());
          BlocProvider.of<FavoritesPlayersBloc>(RouteManager.currentContext)..add(GetFavoritesPlayersData());
          BlocProvider.of<FavoritesLeaguesBloc>(RouteManager.currentContext)..add(GetFavoritesLeaguesData());
          BlocProvider.of<FavoritesNewsBloc>(RouteManager.currentContext)..add(GetFavoritesNewsData());

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
