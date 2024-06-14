import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/gallery/gallery_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';

class MatchGalleryCubit extends Cubit<BaseState>{
  MatchGalleryCubit() : super(InitState());

  static MatchGalleryCubit of(context) => BlocProvider.of(context);

  GalleryModel? galleryModel ;


  Future<void> getMatchGallery(int matchId) async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(MATCHES_URL+"/$matchId/gallery");


      if (r.statusCode == 200 || r.statusCode == 201) {
        print("===================");
        print(r.data);

        print("team gallery are :${r.data}");
        galleryModel = GalleryModel.fromJson(r.data);
        print(galleryModel!.data!.length);
        emit(SuccessState());
      } else {
        emit(ErrorState(msg: ""));
      }

    }catch(e,s){
      print(s);
      showSnackBar(e.toString());
    }
    emit(InitState());

  }

}