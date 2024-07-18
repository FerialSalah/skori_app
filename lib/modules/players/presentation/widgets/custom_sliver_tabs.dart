import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/button/follow_button.dart';
import '../../../../core/widgets/main_text.dart';

class CustomSliverLogo extends StatelessWidget {
  final TabController? tabController;
  final double expandedHeight;
  final String logo;
  final String name;
  final String season;
  final String? continent;
  final String? clubLogo;
  final String? clubName;
  final List<String> tabsTitle;
  final int id;
  final bool isFollowing;

  final String type;

  const CustomSliverLogo({
    super.key,
    required this.logo,
    required this.name,
    this.continent,
    this.clubLogo,
    this.clubName,
    this.tabController,
    required this.expandedHeight,
    required this.tabsTitle,
    required this.season,
    required this.id,
    required this.isFollowing,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      backgroundColor: ColorApp.primary,
     pinned: true,
      toolbarHeight: 0,
      collapsedHeight: 0,
      elevation: 0,
      automaticallyImplyLeading: true,
      leading: SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        background: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: Image.network(
                    logo,
                    height: 82.h,
                    width: 65.w,
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 10.h,
              ),
              MainText(
                text: name,
                color: Colors.white,
                family: TextFontApp.boldFont,
                font: 16,
              ),
              season.isNotEmpty
                  ? SizedBox(
                      height: 8.h,
                    )
                  : SizedBox(),
              season.isNotEmpty
                  ? MainText(
                      text: season,
                      color: Colors.white,
                      family: TextFontApp.regularFont,
                      font: 14,
                    )
                  : SizedBox(),
              season.isNotEmpty
                  ? SizedBox(
                      height: 3.h,
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  clubLogo == null || clubLogo == ''
                      ? SizedBox()
                      : Image.network(
                          clubLogo!,
                          height: 28.h,
                          width: 18.w,
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  MainText(
                    text: clubName,
                    color: ColorApp.white,
                    font: 12,
                    family: TextFontApp.regularFont,
                  ),
                ],
              ),
              FollowButton(
                color: ColorApp.white.withOpacity(.20),
                isFollow: isFollowing,
                id: id,
                type: type,
                width: 120.w,
                height: 30.h,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        expandedTitleScale: 1,

        titlePadding: EdgeInsets.symmetric(vertical: 0, horizontal:0),

        title: TabBar(
          indicatorColor: ColorApp.yellow,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          controller: tabController,
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontFamily: TextFontApp.mediumFont,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: TextFontApp.boldFont,
          ),
          unselectedLabelColor: Colors.white,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: [
            Tab(
              text: tabsTitle[0],
            ),
            Tab(
              text: tabsTitle[1],
            ),
            Tab(
              text: tabsTitle[2],
            ),
            Tab(
              text: tabsTitle[3],
            ),
            Tab(
              text: tabsTitle[4],
            ),
          ],
        ),
      ),
    );
  }
}
