import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/routes/navigator_push.dart';
import 'package:skori/modules/nav_bar/presentation/widgets/home/title_and_all.dart';
import 'package:skori/modules/news/domain/entity/news_entity.dart';
import '../../../../../core/theme/color_app.dart';
import '../../../../../core/theme/textFont_app.dart';
import '../../../../../core/widgets/main_text.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../news/data/model/news_model.dart';
import '../../../../news/presentation/screens/news_details.dart';

class TrendingNews extends StatelessWidget {
  final List<NewsEntity> news;

  const TrendingNews({Key? key, required this.news}) : super(key: key);
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
        TitleAndAll(
          title: LocaleKeys.trendingNews.tr(),
          description: LocaleKeys.trendingNewsHint.tr(),
        ),
        Container(
          height: 250.h,
          child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                    width: 20.w,
                  ),
              itemBuilder: (context, index) {
                int wordCount = countWords(news[index].title.toString());
                print("words in trending are  :$wordCount");
                return GestureDetector(
                  onTap: () {
                    RouteManager.navigateTo(NewsDetailsScreen(
                      newsEntity: news[index],
                    ));
                  },
                  child: Container(
                    height: 250.h,
                    width: 280.w,
                    // CachedImageNetwork(image: news[index].cover,)
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(news[index].cover),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 27),
                      height: 250.h,
                     width: 280.w,
                      color: Colors.black38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: wordCount > 15
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          MainText(
                            text: news[index].title,
                            family: TextFontApp.boldFont,
                            font: 16,
                            color: ColorApp.white,
                            center: wordCount>15? false:true,
                            height: 1.5,
                            maxLines:wordCount>15?2:3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            height: 30.h,
                            width: 160.w,
                            color: ColorApp.red,
                            child: Center(
                                child: MainText(
                              text: news[index].date,
                              family: TextFontApp.boldFont,
                              font: 12,
                              color: ColorApp.white,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
