// import 'package:Ibbil/core/localization/appLocale.dart';
// import 'package:Ibbil/core/theme/color_app.dart';
// import 'package:Ibbil/core/theme/textFont_app.dart';
// import 'package:flutter/material.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
//
// class KeyBoardActionsConfig {
//   /// Creates the [KeyboardActionsConfig] to hook up the fields
//   /// and their focus nodes to our [FormKeyboardActions].
//   static KeyboardActionsConfig buildConfig(
//       BuildContext context, FocusNode focusNode, FocusNode focusNode2) {
//     String lang = AppLocale.of(context).locale.languageCode;
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey.shade200,
//       keyboardBarElevation: 2,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: focusNode,
//           displayArrows: false,
//           toolbarAlignment:
//               lang == "en" ? MainAxisAlignment.end : MainAxisAlignment.start,
//           toolbarButtons: [
//             (focusNode) {
//               return RawMaterialButton(
//                 onPressed: () => focusNode.unfocus(),
//                 child: Text(
//                   AppLocale.of(context).getTranslation("done"),
//                   style: TextStyleApp.buttonTextStyle(ColorApp.primary),
//                 ),
//               );
//             }
//           ],
//         ),
//         KeyboardActionsItem(
//           focusNode: focusNode2,
//           displayArrows: false,
//           toolbarAlignment:
//               lang == "en" ? MainAxisAlignment.end : MainAxisAlignment.start,
//           toolbarButtons: [
//             (focusNode) {
//               return RawMaterialButton(
//                 onPressed: () => focusNode2.unfocus(),
//                 child: Text(
//                   AppLocale.of(context).getTranslation("done"),
//                   style: TextStyleApp.buttonTextStyle(ColorApp.primary),
//                 ),
//               );
//             }
//           ],
//         ),
//       ],
//     );
//   }
//
//   static KeyboardActionsConfig buildSingleConfig(
//       BuildContext context, FocusNode focusNode) {
//     String lang = AppLocale.of(context).locale.languageCode;
//     return KeyboardActionsConfig(
//       keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
//       keyboardBarColor: Colors.grey.shade200,
//       keyboardBarElevation: 2,
//       actions: [
//         KeyboardActionsItem(
//           focusNode: focusNode,
//           displayArrows: false,
//           toolbarAlignment:
//               lang == "en" ? MainAxisAlignment.end : MainAxisAlignment.start,
//           toolbarButtons: [
//             (focusNode) {
//               return RawMaterialButton(
//                 onPressed: () => focusNode.unfocus(),
//                 child: Text(
//                   AppLocale.of(context).getTranslation("done"),
//                   style: TextStyleApp.buttonTextStyle(ColorApp.primary),
//                 ),
//               );
//             }
//           ],
//         ),
//       ],
//     );
//   }
// }
