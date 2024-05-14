import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/nav_bar/presentation/bloc/nav_bar_cubit.dart';
import 'package:skori/modules/nav_bar/presentation/screens/home.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/images/cached_network_image.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../news/data/model/news_model.dart';
import '../../../../news/presentation/screens/news_details.dart';

class LatestNews extends StatelessWidget {
  final List<NewsModel> news;
  const LatestNews({Key? key, required this.news}) : super(key: key);

  int countWords(String text) {
    // Define a regular expression to match words (sequences of characters separated by spaces)
    final regex = RegExp(r'\b\w+\b');

    // Use the regular expression to split the text into words
    final Iterable<Match> matches = regex.allMatches(text);

    // Return the number of matches, which corresponds to the number of words
    return matches.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndAll(title: LocaleKeys.latestNews.tr(),
        description: LocaleKeys.latestNewsHint.tr(),
        onPressed: (){
         NavBarCubit.of(context).changeIndex(2);
        },),

        Container(
          height: 300,

          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: news.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,_)=>SizedBox(width:20.w,),
              itemBuilder: (context,index){
                int wordCount=countWords(news[index].title.toString());
                print("words are  :$wordCount");
                return GestureDetector(
                  onTap: (){
                    RouteManager.navigateTo(NewsDetailsScreen(
                      newsEntity: news[index],

                    ));
                  },
                  child: Container(
                    width: 280.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.borderGray,width: .3)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          height: 160.h,
                          // color: Colors.red,
                          child:CachedImageNetwork(image: news[index].cover,fit: BoxFit.cover,) ,
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5),
                          child: MainText(text:news[index].date,font: 12,family: TextFontApp.regularFont,color: ColorApp.hintGray,hor:2,),
                        ),
                        SizedBox(height: 10.h,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          //width: 300.w,
                          child: MainText(text:news[index].title,
                            maxLines: 2,
                           // overflow: TextOverflow.,
                            font: 16,
                            hor: 2,
                            height: 1.5,
                            family: TextFontApp.boldFont,
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(NewsImages.redUser,width: 14.w,height: 17.h,),
                              SizedBox(width: 5.w,),
                              SizedBox(
                                width: 140.w,
                                child: MainText(
                                  text: news[index].writerName,
                                  color:ColorApp.red,
                                  font: 12,
                                  overflow: TextOverflow.ellipsis,
                                  family: TextFontApp.mediumFont,
                                ),
                              ),
                              // SizedBox(width: 20.w,),
                              // Image.asset(NewsImages.path,width: 14.w,height: 17.h,),
                              // SizedBox(width: 5.w,),
                              // MainText(
                              //   text: "ESPN",
                              //   color:ColorApp.red,
                              //   font: 12,
                              //   family: TextFontApp.mediumFont,
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
