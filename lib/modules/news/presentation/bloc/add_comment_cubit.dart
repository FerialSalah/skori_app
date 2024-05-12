import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/profile/presentation/bloc/following_list/team_following_bloc.dart';

import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/network/network_checker.dart';
import '../../../../core/network/urls_app.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';


class AddCommentCubit extends Cubit<BaseState> {
  AddCommentCubit(this.networkChecker) : super(InitState());

  static AddCommentCubit of(context) => BlocProvider.of(context);

  NetworkChecker networkChecker;
  Future<void> addComment({required int id,required String comment}) async {
    print(id);
    print(comment);
    if (await networkChecker.isDeviceConnected) {
      emit(LoadingState());
      final body = {
        'article_id': id,
        'comment': comment};
      try {
        final r = await DioHelper.post(COMMENT_URL, body: body);
        if (r.statusCode == 200 || r.statusCode == 201) {
          emit(SuccessState());
        } else {
          emit(ErrorState(msg: "Error"));
        }
      } catch (e, s) {
        emit(ErrorState(msg: 'Error'));
      }
    } else {
      emit(OfflineState(msg: "check"));
    }
  }
}



