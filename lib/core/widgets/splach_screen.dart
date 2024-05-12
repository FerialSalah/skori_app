import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:skori/core/app_storage/app_storage.dart';
import 'package:skori/modules/nav_bar/presentation/screens/nav_bar.dart';
import '../../modules/authentication/presentation/screens/login_screen.dart';
import '../constant/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover
        )
        ),
        child: AnimatedSplashScreen(
           backgroundColor: Colors.transparent,
            splashIconSize: double.infinity,
            animationDuration: Duration(seconds: 2),
            splash:Image.asset(AppImages.logo,width: 200,),
          nextScreen: AppStorage.isLogged?NavBarScreen():LoginScreen(),
            // nextScreen:  OnBoardingScreen()
        ),
      ),
    );
  }
}
