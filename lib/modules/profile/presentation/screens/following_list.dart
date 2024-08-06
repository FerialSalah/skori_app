import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../widgets/following/following_leagues_list.dart';
import '../widgets/following/following_player_list.dart';
import '../widgets/following/following_teams_list.dart';





class FollowingListScreen extends StatefulWidget {
  const FollowingListScreen({Key? key, }) : super(key: key);

  @override
  State<FollowingListScreen> createState() => _FollowingListScreenState();
}

class _FollowingListScreenState extends State<FollowingListScreen> {

  int selectedIndex=0;
  PageController pageController = PageController();
  List pages=[
    FollowingPlayersList(),
    FollowingClubsList(),
    FollowingLeaguesList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.appBarTitle(title: LocaleKeys.followingList.tr(),search: false),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 15),
            child: Column(
              children: [
                // ToggleSwitch(
                //   borderWidth: 0.5,
                //   borderColor:  [ColorApp.borderGray],
                //   minHeight: 50.h,
                //   minWidth:1.sw,
                //   initialLabelIndex: selectedIndex,
                //   cornerRadius: 0,
                //   activeFgColor: Colors.white,
                //   inactiveBgColor: Colors.white,
                //   inactiveFgColor: ColorApp.hintGray,
                //   totalSwitches: 3,
                //   fontSize: 14,
                //   //fontFamily: TextFontApp.semiBoldFont,
                //   labels: [LocaleKeys.players.tr(),LocaleKeys.teams.tr(),LocaleKeys.leagues.tr()],
                //   activeBgColor: [ColorApp.yellow, ColorApp.yellow,ColorApp.yellow],
                //   onToggle: (index) {
                //     setState(() {
                //       selectedIndex=index!;
                //
                //     });
                //   },
                // ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorApp.borderGray, width: .5)),
                  child: ButtonsTabBar(
                    backgroundColor: ColorApp.yellow,
                    unselectedBackgroundColor: ColorApp.white,
                    borderWidth: 0,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: context.locale.languageCode == "ar" ? 38 : 36,
                        vertical: 10),
                    borderColor: ColorApp.borderGray,
                    labelSpacing: 0,
                    radius: 0,
                    buttonMargin: EdgeInsets.zero,
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: TextFontApp.boldFont),
                    unselectedLabelStyle: TextStyle(
                        color: ColorApp.hintGray,
                        fontSize: 16,
                        fontFamily: TextFontApp.mediumFont),
                    // Add your tabs here
                    tabs: [
                      Tab(
                        text: LocaleKeys.players.tr(),
                      ),
                      Tab(
                        text: LocaleKeys.teams.tr(),
                      ),
                      Tab(
                        text: LocaleKeys.leagues.tr(),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      FollowingPlayersList(),
                      FollowingClubsList(),
                      FollowingLeaguesList(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}