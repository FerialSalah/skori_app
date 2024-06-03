import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skori/core/cubit/gallery/gallery_model.dart';
import 'package:skori/core/cubit/gallery/team_gallery_cubit.dart';

import '../../../../core/state/base_state.dart';
class TeamGallery extends StatelessWidget {
  const TeamGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.025,right: MediaQuery.of(context).size.width*.025,),
      child: BlocBuilder<TeamGalleryCubit, BaseState>(
        builder: (context, state) {
         GalleryModel? teamGallery = BlocProvider.of<TeamGalleryCubit>(context).galleryModel;
          print(state);
          // if(state is LoadingState){
          //   return ColorLoader();
          // }else if(state is SuccessState){
          //
          // }else {
          //   return Text("Something Error");
          // }
          return teamGallery!.data!.isNotEmpty?
          ListView.separated(
            // physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 25,horizontal: 5),
              itemCount: teamGallery.data!.length,
              shrinkWrap: true,
              primary: false,
              separatorBuilder:(_,c)=>SizedBox(height: 15,),
              itemBuilder: (context,index){
                return Container(
                  child: Image.network(teamGallery.data![index]),
                );
              }):Container();
        },
      ),

    );

  }
}
