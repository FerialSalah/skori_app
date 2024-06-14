import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/gallery/gallery_model.dart';
import '../../../../core/dio_helper/dio_helper.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../network/urls_app.dart';

class LeagueGalleryCubit extends Cubit<BaseState>{
  LeagueGalleryCubit() : super(InitState());

  static LeagueGalleryCubit of(context) => BlocProvider.of(context);

  GalleryModel? galleryModel ;


  Future<void> getLeagueGallery(int leagueId) async {
    emit(LoadingState());
    try{
      final r = await DioHelper.get(LEAGUES_URL+"/$leagueId/gallery");


      if (r.statusCode == 200 || r.statusCode == 201) {
        print("===================");
        print(r.data);

        print("league gallery are :${r.data}");
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