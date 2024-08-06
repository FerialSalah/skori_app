import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/modules/players/presentation/widgets/player_filter_statistics_sheet.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import '../../../../core/app_storage/app_storage.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/routes/navigator_push.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/button/favorite_button.dart';
import '../../../../core/widgets/button/follow_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String name;
  final int id;
  final bool isFollowing;
  final bool isFav;
  final String type;
  final bool isPlayerFilter;

  const CustomSliverAppBar({
    required this.name,
    required this.id,
    required this.isFollowing,
    required this.isFav,
    required this.type,
    required this.isPlayerFilter
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: ColorApp.primary,
      leadingWidth: 60,
      toolbarHeight: 40,
      elevation: 0,
      leading: GestureDetector(
          onTap: () {
            RouteManager.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorApp.white,
          )),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              AppStorage.isLogged == false
                  ? SizedBox()
                  :
             isPlayerFilter? Container(
                padding: EdgeInsets.all(5),
                height: 30.h,
                width: 30.w,
              //  color: ColorApp.white.withOpacity(.15),
                child: GestureDetector(
                    onTap: (){
                      showSlidingBottomSheet(context, builder: (_) {
                        return SlidingSheetDialog(
                            elevation: 8,
                            cornerRadius: 16,
                            snapSpec: SnapSpec(
                              snap: true,
                              snappings: [1.0, 1.0],
                              positioning: SnapPositioning.relativeToAvailableSpace,
                            ),
                            builder: (_, state) {
                              return PlayerFilterStatisticsSheet(playerId: id,);
                            });
                      });
                    },
                    child: Image.asset(AppIcons.filter,height: 16.h,width: 16.w,color: ColorApp.white,)),
              ):Container(),

              SizedBox(
                width: 6,
              ),
              AppStorage.isLogged == false
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(5),
                      height: 35.h,
                      width: 35.w,
                      //color: ColorApp.white.withOpacity(.15),
                      child: FavoriteButton(
                        id: id,
                        type: type,
                        isFavorite: isFav,
                      ),
                    )
            ],
          ),
        )
      ],
    );
  }
}
