import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/core/state/base_state.dart';



class GenderCubit extends Cubit<BaseState>{
  GenderCubit() : super(InitState());

  static GenderCubit of(context)=> BlocProvider.of(context);

  // bool gender = AppStorage.isLogged?AppStorage.getUserModel.gender=="female"?false:true:true;
  bool female=  AppStorage.isLogged?AppStorage.getUserModel.gender=="female"?true:false:false;
  bool male=  AppStorage.isLogged?AppStorage.getUserModel.gender=="male"?true:false:false;
  String theGender = "male";


  void selectGender(bool value,int type){
   // gender=value;
   if(type==0){
     male=value;
     female=false;

     theGender="male";
   }else if(type==1){

     female= value;
     male=false;
     theGender="female";
   }
   emit( InitState());
  }

}
enum genderEnum{male,female}

