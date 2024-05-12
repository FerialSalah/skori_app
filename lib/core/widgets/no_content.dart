// import 'package:dine_in/generated/locale_keys.g.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import '../../constants.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class NoContent extends StatelessWidget {
//   final String? title;
//   NoContent({this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: sizeFromHeight(5)),
//       alignment: Alignment.center,
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Lottie.asset(getLottie("empty"),
//                 height: 100,width: 100,fit: BoxFit.cover),
//             SizedBox(height: 20,),
//             Text(title ?? LocaleKeys.noContent.tr(),textAlign: TextAlign.center,style: TextStyle(
//                color: kPrimaryColor,
//               fontFamily: "dinnextl bold",
//               fontSize: 20,
//             ),),
//           ],
//         ),
//     );
//   }
// }