// import 'package:flutter/material.dart';
//
// import '../../modules/authentication/view/screens/login_screen.dart';
// import '../../modules/authentication/view/screens/sign_up__screen.dart';
// import '../../modules/home/presentation/screens/bottom_nav_screen.dart';
// import '../constant/app_assets.dart';
// import '../localization/appLocale.dart';
// import '../routes/navigator_push.dart';
// import '../theme/color_app.dart';
// import '../theme/textFont_app.dart';
// import 'button/button_app.dart';
// import 'icon/icon_app.dart';
//
// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     String lang = AppLocale.of(context).locale.languageCode;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               AppHomeImages.onboardingBackground,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 ColorApp.primary.withOpacity(0.7),
//                 ColorApp.primary.withOpacity(0.2),
//                 Colors.transparent
//               ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
//             ),
//           ),
//           Positioned(
//               right: 40,
//               left: 40,
//               top: 120,
//               child: Image.asset(AppLogoImages.whiteLogo_xxhdpi)),
//           Positioned(
//               top: 40,
//               right: 20,
//               child: InkWell(
//                 onTap: () => MagicRouter.navigateAndPopAll(
//                     ButtonNavBarScreen(initIndex: 4)),
//                 child: Directionality(
//                   textDirection:
//                       lang == "en" ? TextDirection.rtl : TextDirection.ltr,
//                   child: Row(
//                     children: [
//                       Text(
//                         AppLocale.of(context).getTranslation("skip"),
//                         style: TextStyleApp.bigTitleTextStyle(
//                             ColorApp.black, 18, FontWeight.w700),
//                       ),
//                       IconApp.back_forward_icon(context),
//                     ],
//                   ),
//                 ),
//               )),
//           Positioned(
//               right: 40,
//               left: 40,
//               bottom: 100,
//               child: ButtonApp.nextButton(() {
//                 RouteManager.navigateTo(LoginScreen());
//               }, null, AppLocale.of(context).getTranslation("sign_in"),
//                   color: ColorApp.white, textColor: ColorApp.primary)),
//           Positioned(
//             right: 40,
//             left: 40,
//             bottom: 50,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: Text(
//                       AppLocale.of(context)
//                           .getTranslation("don't_have_an_account?"),
//                       style: TextStyleApp.buttonTextStyle(ColorApp.white),
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   Flexible(
//                     flex: 1,
//                     child: InkWell(
//                       onTap: () => MagicRouter.navigateTo(RegisterScreen()),
//                       child: Text(
//                         AppLocale.of(context).getTranslation("create_account"),
//                         style: TextStyleApp.buttonTextStyle(
//                             ColorApp.secondaryPrimary),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
