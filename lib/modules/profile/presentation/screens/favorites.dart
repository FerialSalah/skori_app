import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/generated/locale_keys.g.dart';
import 'package:skori/modules/profile/presentation/widgets/favourites/favorite_leagues_list.dart';
import 'package:skori/modules/profile/presentation/widgets/favourites/favorite_news_list.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/widgets/app_bar/app_bar_title.dart';
import '../widgets/favourites/favorite_player_list.dart';
import '../widgets/favourites/favorite_teams_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  List pages = [
    FavoritePlayersList(),
    FavoriteTeamsList(),
    FavoritesLeaguesList(),
    FavoriteNewsList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars.appBarTitle(
            title: LocaleKeys.favorites.tr(), search: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Column(
            children: [
              ToggleSwitch(
                borderWidth: 0.5,
                borderColor: [ColorApp.borderGray],
                minHeight: 50.h,
                minWidth: 21.sw,
                initialLabelIndex: selectedIndex,
                cornerRadius: 0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: ColorApp.hintGray,
                totalSwitches: 4,
                fontSize: 14,
               // fontFamily: TextFontApp.semiBoldFont,
                labels: [
                  LocaleKeys.players.tr(),
                  LocaleKeys.teams.tr(),
                  LocaleKeys.leagues.tr(),
                  LocaleKeys.newKey.tr()
                ],
                activeBgColor: [ColorApp.yellow, ColorApp.yellow],
                onToggle: (index) {
                  setState(() {
                    selectedIndex = index!;
                  });
                },
              ),
              Expanded(child: pages[selectedIndex]),
            ],
          ),
        ));
  }
}
