import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/cubit/gallery/league_gallery_cubit.dart';
import 'package:skori/core/cubit/gallery/player_gallery_cubit.dart';

import '../../../../core/cubit/season/season_cubit.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/image_preview.dart';
class PlayerGallery extends StatelessWidget {
  const PlayerGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerGalleryCubit, BaseState>(
      builder: (context, state) {
        final gallery =
            BlocProvider.of<PlayerGalleryCubit>(context).galleryModel;

        return gallery!.data!.isEmpty||gallery.data==null
            ? emptyShow()
            : GridView.builder(
              itemCount: gallery.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between the columns
                mainAxisSpacing: 10.0, // Spacing between the rows

              ),
              itemBuilder: (BuildContext context, int index) {
                // This function is called for each item in the grid
                return GestureDetector(
                  onTap: (){
                    openGallery(index: index, context: context, images: gallery.data!);

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    // Example background color
                    child: Image.network(gallery.data![index],
                      height: 200.h,
                      width: 180.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
      },
    );
  }
}
