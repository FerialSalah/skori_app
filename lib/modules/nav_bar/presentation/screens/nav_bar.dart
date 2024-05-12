import 'dart:async';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skori/core/constant/constants.dart';
import '../../../../core/theme/color_app.dart';
import '../../../../core/theme/textFont_app.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/nav_bar_cubit.dart';
import '../bloc/nav_bar_state.dart';


class NavBarScreen extends StatefulWidget {


  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen>
    with SingleTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();

  // var _bottomNavIndex = 0; //default index of a first screens

  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;


  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: ColorApp.primary,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }
  List titleList= [
    LocaleKeys.home.tr(),
    LocaleKeys.matches.tr(),
    LocaleKeys.news.tr(),
    LocaleKeys.myAcc.tr(),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarStates>(
      builder: (context, state) {
        final cubit = NavBarCubit.of(context);
        return Scaffold(
          extendBody: true,
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: cubit.iconList.length,
              height: 60.h,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? ColorApp.red : ColorApp.hintGray;
                return Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(cubit.iconList[index],
                      height: 17.h, width: 15.w, color: color,),
                     SizedBox(height: 7.h),
                    AutoSizeText(
                     titleList[index],
                      maxLines: 1,
                      style: TextStyle(
                          color: color,
                          fontFamily: TextFontApp.mediumFont, fontSize: 11),
                      group: autoSizeGroup,
                    )
                  ],
                );
              },
              borderColor:ColorApp.borderGray ,
              backgroundColor:  ColorApp.white,
              activeIndex: cubit.currentIndex,
              splashColor: ColorApp.red,
              notchAndCornersAnimation: animation,
              splashSpeedInMilliseconds: 300,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              gapLocation: GapLocation.none,
              onTap: (index) => cubit.changeIndex(index)),
        );
      },
    );
  }
}


