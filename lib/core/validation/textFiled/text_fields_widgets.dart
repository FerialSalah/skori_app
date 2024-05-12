// import 'dart:ui' as ui;
// import 'package:country_calling_code_picker/country_code_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:souq_eletara/core/validation/textFiled/text_field_app.dart';
//
// import '../../theme/color_app.dart';
// import '../../widgets/button/button_app.dart';
// import '../cubit/country_code_cubit.dart';
// import '../../state/base_state.dart';
// import '../cubit/cupertinoPicker_cubit.dart';
// import '../cubit/datePicker_cubit.dart';
// import '../validations.dart';
//
// class TextFieldWidget {
//   // users information Field
//   static nameTextField({
//     required BuildContext context,
//     required TextEditingController textEditingController,
//     String? hint,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//   }) =>
//       TextFieldApp(
//         hint: hint ?? "",
//         controllerText: textEditingController,
//         textType: TextInputType.name,
//         isPassword: false,
//         errors: map != null ? _checkErrorMassage(map, 'name') : null,
//         action: TextInputAction.next,
//         label: hint ?? "",
//         withPrefixIcon: false,
//         prefixChild: const Icon(Icons.person_outline),
//         focusFieldNode: focusNode,
//         validator: (_) => Validations.validateName(textEditingController.text),
//       );
//   static indetiferTextField({
//     required BuildContext context,
//     required TextEditingController textEditingController,
//     String? hint,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//   }) =>
//       KeyboardActions(
//         autoScroll: false,
//         config: KeyBoardActionsConfig.buildSingleConfig(context, focusNode),
//         child: TextFieldApp(
//           hint: hint ?? "",
//           controllerText: textEditingController,
//           textType: TextInputType.number,
//           isPassword: false,
//           onFieldSubmitted: (input) =>
//               Validations.validateIndetiferCard(textEditingController.text),
//           onEditingComplete: () =>
//               Validations.validateIndetiferCard(textEditingController.text),
//           errors: map != null ? _checkErrorMassage(map, 'national_id') : null,
//           action: TextInputAction.done,
//           label: hint ?? "",
//           withPrefixIcon: false,
//           prefixChild: const Icon(Icons.person_outline),
//           focusFieldNode: focusNode,
//           validator: (_) =>
//               Validations.validateIndetiferCard(textEditingController.text),
//         ),
//       );
//
//   static emailTextField({
//     required BuildContext context,
//     String? hint,
//     required TextEditingController textEditingController,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//   }) =>
//       TextFieldApp(
//         onChange: (val) {},
//         controllerText: textEditingController,
//         textType: TextInputType.emailAddress,
//         isPassword: false,
//         action: TextInputAction.next,
//         label: hint ?? "",
//         withPrefixIcon: false,
//         errors: map != null ? _checkErrorMassage(map, 'email') : null,
//         prefixChild: const Icon(Icons.mail_outline_rounded),
//         focusFieldNode: focusNode,
//         hint: hint ?? " ",
//         validator: (_) => Validations.validateEmail(textEditingController.text),
//       );
//
//   static phoneTextField({
//     required BuildContext context,
//     String? hint,
//     double? width,
//     required TextEditingController textEditingController,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//   }) =>
//       KeyboardActions(
//         autoScroll: false,
//         config: KeyBoardActionsConfig.buildSingleConfig(context, focusNode),
//         child: TextFieldApp(
//           width: width,
//           focusFieldNode: focusNode,
//           hint: hint ?? "",
//           controllerText: textEditingController,
//           textType: TextInputType.phone,
//           isPassword: false,
//           action: TextInputAction.done,
//           errors: map != null
//               ? _checkErrorMassage(map, 'phone', context: context)
//               : null,
//           label: hint ?? "",
//           withPrefixIcon: false,
//           validator: (_) {
//             print("validation");
//             return BlocProvider.of<ValidationCubit>(context)
//                 .checkValidationPhoneNumber(_);
//           },
//           prefixChild: BlocBuilder<CountryCodeCubit, BaseState>(
//             builder: (context, state) {
//               final cubit = CountryCodeCubit.of(context);
//               return GestureDetector(
//                 onTap: () {
//                   cubit.onPressedShowBottomSheet(context);
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     cubit.selectedCountry == null
//                         ? const SizedBox()
//                         : Image.asset(
//                             cubit.selectedCountry!.flag,
//                             package: countryCodePackageName,
//                             width: 20,
//                           ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     cubit.selectedCountry == null
//                         ? const Icon(Icons.phone_android)
//                         : Text(
//                             cubit.selectedCountry!.callingCode,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//   static passwordTextField({
//     required BuildContext context,
//     String? hint,
//     double? width,
//     required TextEditingController textEditingController,
//     Map<String, dynamic>? map,
//     FocusNode? focusNode,
//   }) =>
//       TextFieldApp(
//           width: width,
//           focusFieldNode: focusNode,
//           hint: hint ?? "",
//           controllerText: textEditingController,
//           textType: TextInputType.text,
//           isPassword: true,
//           action: TextInputAction.done,
//           errors:
//               map != null ? _checkErrorMassage(map, 'confirm_password') : null,
//           label: hint ?? "",
//           withPrefixIcon: false,
//           validator: (_) =>
//               Validations.validatePassword(textEditingController.text),
//           prefixChild: null);
//   static confirmPasswordTextField({
//     required BuildContext context,
//     String? hint,
//     double? width,
//     required TextEditingController textEditingController,
//     required TextEditingController confrimtextEditingController,
//     Map<String, dynamic>? map,
//     FocusNode? focusNode,
//   }) =>
//       TextFieldApp(
//           width: width,
//           focusFieldNode: focusNode,
//           hint: hint ?? "",
//           controllerText: textEditingController,
//           textType: TextInputType.text,
//           isPassword: true,
//           action: TextInputAction.done,
//           errors:
//               map != null ? _checkErrorMassage(map, 'confirm_password') : null,
//           label: hint ?? "",
//           withPrefixIcon: false,
//           validator: (_) => Validations.validateConfirmPassword(
//               textEditingController.text, confrimtextEditingController.text),
//           prefixChild: null);
//
//   ////// shipment fields
//   static numberShipmentTextField({
//     required BuildContext context,
//     required TextEditingController textEditingController,
//     String? hint,
//     Map<String, dynamic>? map,
//     final Function(String?)? onChange,
//     final Function(String)? onFieldSubmitted,
//     final Function()? onEditingComplete,
//     required FocusNode focusNode,
//   }) =>
//       TextFieldApp(
//         hint: hint ?? "",
//         controllerText: textEditingController,
//         textType: TextInputType.number,
//         onChange: onChange,
//         onEditingComplete: onEditingComplete,
//         onFieldSubmitted: onFieldSubmitted,
//         isPassword: false,
//         width: MediaQuery.of(context).size.width,
//         errors: map != null ? _checkErrorMassage(map, 'name') : null,
//         action: TextInputAction.next,
//         label: hint ?? "",
//         withPrefixIcon: false,
//         prefixChild: const Icon(Icons.person_outline),
//         focusFieldNode: focusNode,
//         validator: (_) =>
//             Validations.validateIndetiferCard(textEditingController.text),
//       );
//   static amountShipmentTextField({
//     required BuildContext context,
//     required TextEditingController textEditingController,
//     String? hint,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//   }) =>
//       TextFieldApp(
//         hint: hint ?? "",
//         width: MediaQuery.of(context).size.width,
//         controllerText: textEditingController,
//         textType: TextInputType.number,
//         isPassword: false,
//         errors: map != null ? _checkErrorMassage(map, 'name') : null,
//         action: TextInputAction.next,
//         label: hint ?? "",
//         withPrefixIcon: false,
//         readOnly: true,
//         prefixChild: const Icon(Icons.person_outline),
//         focusFieldNode: focusNode,
//         validator: (_) => null,
//         onTap: () {
//           showCupertinoModalPopup<void>(
//               context: context,
//               builder: (context) => widgetCupertinoPickerUI(
//                   widgetCupertinoPicker(context), context));
//         },
//       );
//   static List<AmountShpmitModel> listFootballClubs = [
//     AmountShpmitModel("500 - 1000", 750),
//     AmountShpmitModel("1000 - 2000", 1500),
//     AmountShpmitModel("2000 - 4000", 3000),
//     AmountShpmitModel("4000 - 8000", 6000),
//     AmountShpmitModel("8000 - 16000", 12000),
//   ];
//   // String selectedItem;
//   // int selectedItemPosition = 0;
//   static Widget widgetCupertinoPickerUI(Widget picker, BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 7),
//       color: CupertinoColors.white,
//       height: 260,
//       child: DefaultTextStyle(
//         style: const TextStyle(
//           color: CupertinoColors.black,
//           fontWeight: FontWeight.w300,
//           fontSize: 20,
//         ),
//         child: GestureDetector(
// // Blocks taps from propagating to the modal sheet and popping.
//           child: SafeArea(
//             top: false,
//             child: Column(
//               children: [
//                 Expanded(child: picker),
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: ButtonApp.nextButton(() {
//                     Navigator.pop(context);
//                   }, double.infinity, "اختر"),
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {},
//         ),
//       ),
//     );
//   }
//
//   static Widget widgetCupertinoPicker(BuildContext context) {
//     var selectedPickerIndex =
//         context.watch<CupertinoPickerCubit>().indexSelector;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: CupertinoPicker(
//         scrollController:
//             FixedExtentScrollController(initialItem: selectedPickerIndex),
//         selectionOverlay: Container(
//           decoration: BoxDecoration(
//               color: Colors.grey.shade100.withOpacity(0.4),
//               border: Border(
//                   top: BorderSide(color: ColorApp.lightGrey),
//                   bottom: BorderSide(color: ColorApp.lightGrey))),
//         ),
//         backgroundColor: Colors.white,
//         itemExtent: 50,
//         looping: false,
//         magnification: 1.0,
//         children: listFootballClubs
//             .map((item) => Center(
//                   child: Material(
//                     child: InkWell(
//                       onTap: () => print(item),
//                       child: Text(
//                         item.range,
//                         style: const TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ))
//             .toList(),
//         onSelectedItemChanged: (index) {
//           print("onSelectedItemChanged ${index}");
//           BlocProvider.of<CupertinoPickerCubit>(context)
//               .getSelectedCupertinoPicker(listFootballClubs[index].range, index,
//                   listFootballClubs[index].value);
// // setState(() => this.selectedItemPosition = index);
//           // selectedItem = listFootballClubs[index];
// // print(“Selected Item: $index”);
// // setState(() {
// // selectItem=value.toString();
// // });
//         },
//       ),
//     );
//   }
//
//   static birthdayTextField({
//     required BuildContext context,
//     String? hint,
//     required TextEditingController textEditingController,
//     Map<String, dynamic>? map,
//     required FocusNode focusNode,
//     required DateTime? selectedDate,
//   }) =>
//       TextFieldApp(
//           controllerText: textEditingController,
//           textType: TextInputType.emailAddress,
//           isPassword: false,
//           action: TextInputAction.next,
//           widthPrifxIcon: 30,
//           label: hint ?? "تاريخ النقل",
//           withPrefixIcon: false,
//           errors: map != null ? _checkErrorMassage(map, 'birth_date') : null,
//           prefixChild: const Icon(Icons.date_range),
//           focusFieldNode: focusNode,
//           hint: hint ?? "DD / MM / YY",
//           suffixIcon: const Icon(Icons.date_range),
//           readOnly: true,
//           validator: (_) =>
//               Validations.validateBirthdate(textEditingController.text),
//           onTap: () {
//             showDatePicker(
//               // locale: AppLocale.of(context).locale,
//               context: context,
//               initialDate: selectedDate ?? DateTime.now(),
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2050),
//             ).then((value) {
//               BlocProvider.of<DatePickerCubit>(context)
//                   .addDateTime(value.toString().substring(0, 10));
//               textEditingController.text = value.toString().substring(0, 10);
//             });
//           });
//   static positionMapTextField(
//           {required BuildContext context,
//           String? hint,
//           required TextEditingController textEditingController,
//           Map<String, dynamic>? map,
//           required FocusNode focusNode,
//           VoidCallback? function}) =>
//       TextFieldApp(
//           controllerText: textEditingController,
//           textType: TextInputType.streetAddress,
//           isPassword: false,
//           action: TextInputAction.done,
//           label: hint ?? "",
//           withPrefixIcon: false,
//           suffixIcon: const Icon(Icons.place),
//           errors: map != null ? _checkErrorMassage(map, 'birth_date') : null,
//           prefixChild: const Icon(
//             Icons.date_range,
//           ),
//           focusFieldNode: focusNode,
//           hint: hint ?? "",
//           readOnly: true,
//           validator: (_) =>
//               Validations.validateBirthdate(textEditingController.text),
//           onTap: () => function!());
//
//   static String? _checkErrorMassage(Map<String, dynamic> map, String keyName,
//       {BuildContext? context}) {
//     var msg;
//     for (var key in map.keys) {
//       if (key.contains(keyName)) {
//         msg = map[keyName][0];
//         if (context != null) {
//           BlocProvider.of<ValidationCubit>(context)
//               .checkValidationPhoneNumber(msg);
//         }
//       } else if (key.contains(keyName)) {
//         msg = null;
//       }
//     }
//     return msg;
//   }
// }
//
// class AlwaysDisabledFocusNode extends FocusNode {
//   @override
//   bool get hasFocus => false;
// }
//
// class AmountShpmitModel {
//   final String range;
//   final int value;
//
//   AmountShpmitModel(this.range, this.value);
// }
