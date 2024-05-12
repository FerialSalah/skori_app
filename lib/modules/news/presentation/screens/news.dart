import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/theme/textFont_app.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/news/presentation/bloc/news_bloc.dart';
import 'package:skori/modules/news/presentation/bloc/news_event.dart';
import 'package:skori/modules/news/presentation/widgets/all_news_list.dart';
import 'package:skori/modules/news/presentation/widgets/exclusive_list.dart';
import 'package:skori/modules/news/presentation/widgets/highlight_list.dart';
import 'package:skori/modules/news/presentation/widgets/interview_list.dart';
import 'package:skori/modules/news/presentation/widgets/new_news_list.dart';
import 'package:skori/modules/news/presentation/widgets/news_card.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/state/base_state.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../../../../core/widgets/empty.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../core/widgets/offline_widget.dart';
import '../../../../core/widgets/shimmer_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.appBarTitle(back: false,title: LocaleKeys.news.tr()),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorApp.borderGray,
                      width: .5
                  )
              ),
              child: ButtonsTabBar(
                backgroundColor: ColorApp.yellow,
                unselectedBackgroundColor: ColorApp.white,
                borderWidth: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                borderColor: ColorApp.borderGray,
                labelSpacing: 0,
                radius: 0,
                buttonMargin: EdgeInsets.zero,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: TextFontApp.boldFont

                ),
                unselectedLabelStyle: TextStyle(
                    color: ColorApp.hintGray,
                    fontSize: 16,
                    fontFamily: TextFontApp.mediumFont
                ),
                // Add your tabs here
                tabs: [
                  Tab(text: LocaleKeys.all.tr(),),
                  Tab(text: LocaleKeys.newKey.tr(),),
                  Tab(text: LocaleKeys.exclusive.tr(),),
                  Tab(text: LocaleKeys.interview.tr(),),
                  Tab(text: LocaleKeys.highlight.tr(),),
                ],
              ),
            ),

            Expanded(
              child:   TabBarView(
                children: [
                  AllNewsList(),
                  NewNewsList(),
                  ExclusiveNewsList(),
                  InterviewNewsList(),
                  HighlightNewsList(),

                ],
              ),),

          ],
        ),
      )
    );
  }
}
