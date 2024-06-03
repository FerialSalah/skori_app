import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/favorite_button.dart';
import '../../../../core/widgets/images/cached_network_image.dart';
import '../../../../core/widgets/main_text.dart';
import '../screens/news_details.dart';

class NewsCart extends StatelessWidget {
  final NewsEntity newsEntity;
  final bool? isPlayer;
  final bool? isTeam;

  const NewsCart(
      {Key? key,
      required this.newsEntity,
      required this.isPlayer,
      required this.isTeam
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(newsEntity.leagueName!.isEmpty);
    print("newsEntity.teamId: ${newsEntity.teamId}");
    return GestureDetector(
      onTap: () {
        RouteManager.navigateTo(NewsDetailsScreen(
          newsEntity: newsEntity,
          isPlayer: isPlayer,
        ));
      },
      child: Container(
        //height:3.h,
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 171.h,
                  //width: 314.w,
                  child: CachedImageNetwork(
                    image: newsEntity.cover,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        height: 30.h,
                        width: 30.w,
                        color: ColorApp.white.withOpacity(.15),
                        child: FavoriteButton(
                          isFavorite: newsEntity!.isFavorite!,
                          id: newsEntity.id,
                          type: "article",
                        )))
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainText(
                    text: newsEntity.date,
                    color: ColorApp.hintGray,
                    font: 12,
                    family: TextFontApp.regularFont,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 350.w,
                    child: MainText(
                      text: newsEntity.title,
                      maxLines: 2,
                      height: 1.5,
                      overflow: TextOverflow.clip,
                      font: 14,
                      family: TextFontApp.boldFont,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        NewsImages.redUser,
                        width: 14.w,
                        height: 17.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        // width: 70.w,
                        child: MainText(
                          text: newsEntity.writerName,
                          color: ColorApp.red,
                          font: 12,
                          overflow: TextOverflow.ellipsis,
                          family: TextFontApp.mediumFont,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      if (!isPlayer!)
                        newsEntity.playerId == 0
                            ? Container()
                            : Image.asset(
                                NewsImages.redUser,
                                width: 14.w,
                                height: 17.h,
                              ),
                      SizedBox(
                        width: 5.w,
                      ),
                      if (!isPlayer!)
                        newsEntity.playerId == 0
                            ? Container()
                            : SizedBox(
                                // width: 70.w,
                                child: MainText(
                                  text: newsEntity.playerName,
                                  color: ColorApp.red,
                                  font: 12,
                                  overflow: TextOverflow.ellipsis,
                                  family: TextFontApp.mediumFont,
                                ),
                              ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  newsEntity.leagueName!.isNotEmpty
                      ? Row(
                          children: [
                            SizedBox(
                                height: 17,
                                width: 17,
                                child: CachedImageNetwork(
                                  image: newsEntity.leagueLogo,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              width: 5.w,
                            ),
                            SizedBox(
                              // width: 80.w,
                              child: MainText(
                                text: newsEntity.leagueName,
                                color: ColorApp.red,
                                font: 12,
                                overflow: TextOverflow.ellipsis,
                                family: TextFontApp.mediumFont,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (!isTeam!)
                    Row(
                      children: [
                        newsEntity.teamId == 0
                            ? Container()
                            : Image.network(
                                newsEntity.teamLogo ?? "",
                                width: 14.w,
                                height: 17.h,
                              ),
                        SizedBox(
                          width: 5.w,
                        ),
                        newsEntity.teamId == 0
                            ? Container()
                            : SizedBox(
                                // width: 80.w,
                                child: MainText(
                                  text: newsEntity.teamName,
                                  color: ColorApp.red,
                                  font: 12,
                                  overflow: TextOverflow.ellipsis,
                                  family: TextFontApp.mediumFont,
                                ),
                              ),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
