// // ignore_for_file: use_key_in_widget_constructors, avoid_print
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../localization/appLocale.dart';
// import '../../page_dimensions/app_size.dart';
// import '../../theme/color_app.dart';
// import '../../theme/textFont_app.dart';
// import '../validations.dart';
//
// class TextFieldApp extends StatelessWidget with Validations {
//   final String hint;
//   final String? label;
//   final TextEditingController controllerText;
//   final TextInputType textType;
//   final String? errors;
//   final bool isPassword;
//   final bool withPrefixIcon;
//   final Widget? prefixChild;
//   final FocusNode? focusFieldNode;
//   final double? width;
//   final TextInputAction action;
//   final Widget? suffixIcon;
//   final Function()? onTap;
//   final Function(String?)? onChange;
//   final Function(String)? onFieldSubmitted;
//   final Function()? onEditingComplete;
//   final bool readOnly;
//   final double? widthPrifxIcon;
//   final String? Function(String?)? validator;
//
//   TextFieldApp({
//     required this.hint,
//     required this.controllerText,
//     required this.textType,
//     required this.isPassword,
//     this.label,
//     required this.withPrefixIcon,
//     required this.prefixChild,
//     required this.action,
//     this.focusFieldNode,
//     this.errors,
//     this.suffixIcon,
//     this.onTap,
//     this.readOnly = false,
//     this.validator,
//     this.onChange,
//     this.width,
//     this.onFieldSubmitted,
//     this.onEditingComplete,
//     this.widthPrifxIcon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     String locale = AppLocale.of(context).locale.languageCode;
//     return TextFormField(
//       onChanged: onChange,
//       onFieldSubmitted: onFieldSubmitted,
//       onEditingComplete: onEditingComplete,
//       readOnly: readOnly,
//       focusNode: focusFieldNode,
//
//       onTap: onTap,
//       inputFormatters: [
//         FilteringTextInputFormatter.deny(RegExp(r'^0+')),
//       ],
//       keyboardType: textType,
//       validator: (value) => validator!(value),
//       // validator: (value) => isPassword ? Validations.validatePassword(value) : Validations.validatePhone(value),
//       cursorColor: ColorApp.primary,
//       controller: controllerText,
//       textInputAction: action,
//
//       decoration: _textFieldInputDecoration(context, locale),
//       obscureText: isPassword,
//     );
//   }
//
//   InputDecoration _textFieldInputDecoration(
//           BuildContext context, String locale) =>
//       InputDecoration(
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
//
//         // border: OutlineInputBorder(
//         //     borderRadius: BorderRadius.circular(10),
//         //     borderSide: BorderSide(color: Colors.grey.shade100)),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: Colors.grey.shade200)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: ColorApp.primary),
//         ),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(color: ColorApp.error)),
//         // isDense: true,
//         errorText: errors ?? errors,
//         hintStyle: TextStyleApp.hintTextFieldStyle(ColorApp.greyTextField,
//             fontWeight: FontWeight.w300),
//
//         // contentPadding:
//         //     const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//         labelStyle: TextStyleApp.hintTextFieldStyle(ColorApp.greyTextField),
//         errorStyle: const TextStyle(
//             color: Colors.red, fontWeight: FontWeight.w300, fontSize: 10),
//         hintTextDirection:
//             locale == "ar" ? TextDirection.rtl : TextDirection.ltr,
//         hintText: hint,
//         labelText: label,
//         prefixIconConstraints: widthPrifxIcon == null
//             ? const BoxConstraints(minWidth: 58, maxWidth: 80)
//             : BoxConstraints(
//                 minWidth: (widthPrifxIcon! - 10).toDouble(),
//                 maxWidth: widthPrifxIcon!),
//         prefixIcon: withPrefixIcon ? _prefixIcon(locale) : null,
//         prefixStyle: TextStyle(locale: Locale(locale)),
//         suffixIcon: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: suffixIcon,
//         ), //Adding Suffix Icon to password Form
//         suffixIconConstraints: const BoxConstraints(minWidth: 20, maxWidth: 30),
//       );
//
//   Widget _prefixIcon(String locale) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10),
//       height: AppSize.textFieldHeight,
//       decoration: BoxDecoration(
//         border: Border(
//           left: BorderSide(color: ColorApp.secondaryLightGrey),
//         ),
//       ),
//       child: Center(
//         child: Container(
//           child: prefixChild,
//         ),
//       ),
//     );
//   }
// }
//
// class LowerCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return TextEditingValue(
//       text: newValue.text.toLowerCase(),
//       selection: newValue.selection,
//     );
//   }
// }
