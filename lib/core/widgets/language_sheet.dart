// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import '../../../core/dio_helper/dio_helper.dart';
// import '../../../core/widgets/main_text.dart';
// import '../../../generated/locale_keys.g.dart';
// import '../constant/constants.dart';
// import '../routes/navigator_push.dart';
// import '../theme/color_app.dart';
// import '../theme/textFont_app.dart';
// import 'button/button_app.dart';
//
//
//
// class LanguageSheet extends StatefulWidget {
//   const LanguageSheet({Key? key}) : super(key: key);
//
//   @override
//   State<LanguageSheet> createState() => _LanguageSheetState();
// }
//
// class _LanguageSheetState extends State<LanguageSheet> {
//   late bool Ar;
//   late bool En;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (RouteManager.currentContext.locale.languageCode == 'en') {
//       setState(() {
//         En = true;
//         Ar=false;
//         DioHelper.lang="en";
//       });
//     } else {
//       Ar = true;
//       En=false;
//       DioHelper.lang="ar";
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       color: Colors.transparent, //could change this to Color(0xFF737373),
//
//       child: Container(
//           padding: EdgeInsets.symmetric(
//               horizontal: 20, vertical: 20),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight:
//                   Radius.circular(15))),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment:
//             CrossAxisAlignment.center,
//             children: [
//               MainText(
//                 text: LocaleKeys.language.tr(),
//                 color: ColorApp.black,
//                 font: 20,
//                 family: TextFontApp.mediumFont,
//               ),
//               MainText(
//                 text: "Choose the app language to preview it",
//                 font: 14,
//                 color: ColorApp.decColor,
//                 family: TextFontApp.regularFont,
//               ),
//               Divider(thickness: .5,color:  ColorApp.lightPrimary,),
//
//               GestureDetector(
//
//                 child: Container(
//                   // margin: EdgeInsets.only(top:height*.02),
//                   color: Colors.transparent,
//                   child: Row(
//                     children: [
//                       Text(
//                         "العربية",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: ColorApp.black,
//                             fontFamily:"VaMedium"),
//                       ),
//                       Spacer(),
//                       Checkbox(
//                         activeColor: ColorApp.primary,
//                           value: Ar, onChanged: (v){
//                         setState(() {
//                           Ar= !Ar;
//                           En=false;
//                         });
//                       })
//                     ],
//                   ),
//                 ),
//               ),
//               Divider(thickness: .5,color: ColorApp.lightPrimary,),
//               GestureDetector(
//
//                 child: Container(
//                   // margin: EdgeInsets.only(top:height*.02),
//                   color: Colors.transparent,
//                   child: Row(
//                     children: [
//
//                       Text(
//                         "English",
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: ColorApp.black,
//                             fontFamily:"RbMedium"),
//                       ),
//                       Spacer(),
//                       Checkbox(
//                           activeColor: ColorApp.primary,
//                           value: En, onChanged: (v){
//                         setState(() {
//                           En= !En;
//                           Ar=false;
//                         });
//                       })
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               AppButton(
//                 title: LocaleKeys.save.tr(),
//                 onPressed: (){
//                   if (En == true) {
//                     setState(() {
//                       context.setLocale(Locale('en'));
//                       DioHelper.lang = context.locale.languageCode;
//                      isEn=true;
//
//                     });
//
//                   } else {
//                     setState(() {
//                       context.setLocale(Locale('ar'));
//                       DioHelper.lang = context.locale.languageCode;
//                       isEn=false;
//
//                     });
//                   }
//                   // NavBarCubit.of(context).changeState();
//                   // RouteManager.navigateAndPopAll(NavBarScreen());
//                   recallData();
//                 },
//               ),
//             ],
//           )),
//     );
//   }
// }
