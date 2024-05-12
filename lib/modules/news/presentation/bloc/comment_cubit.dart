import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/news/data/model/comment_model.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/team_following_bloc.dart';

import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/network/network_checker.dart';
import '../../../../core/network/urls_app.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';


class CommentCubit extends Cubit<BaseState> {
  CommentCubit(this.networkChecker) : super(InitState());

  static CommentCubit of(context) => BlocProvider.of(context);
  NetworkChecker networkChecker;

  CommentModel commentModel =CommentModel();

  Future<void> getComments({required int id}) async {
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      try {
        final r = await DioHelper.get("${NEWS_URL}/$id${COMMENT_URL}");
        if (r.statusCode == 200 || r.statusCode == 201) {
          print(r.data);
          commentModel = CommentModel.fromJson(r.data);
          emit(SuccessState());

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



