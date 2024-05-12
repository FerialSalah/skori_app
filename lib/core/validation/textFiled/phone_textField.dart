// import 'package:country_calling_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../localization/appLocale.dart';
// import '../../state/base_state.dart';
// import '../cubit/country_code_cubit.dart';
// import '../cubit/validation_cubit.dart';
//
// class PhoneTextFieldApp extends StatelessWidget {
//   final FocusNode phonefocusNode;
//   final TextEditingController phoneEditing;
//   final Map<String, dynamic>? errors;
//   const PhoneTextFieldApp(
//       {super.key,
//       required this.phonefocusNode,
//       required this.phoneEditing,
//       required this.errors});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: TextFieldWidget.phoneTextField(
//               hint: AppLocale.of(context).getTranslation("mobile_number"),
//               context: context,
//               map: errors,
//               textEditingController: phoneEditing,
//               focusNode: phonefocusNode),
//         ),
//         const SizedBox(width: 8),
//         _prefixIcon("ar", context)
//       ],
//     );
//   }
//
//   Widget _prefixIcon(String locale, BuildContext context) {
//     var hasError = context.watch<ValidationCubit>().isValidated;
//     print(hasError);
//     return Container(
//       margin: hasError
//           ? const EdgeInsets.only(right: 10, bottom: 25)
//           : const EdgeInsets.only(right: 10, bottom: 0),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       height: 52,
//       decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(8)),
//           border: Border.all(color: Colors.grey.shade200)),
//       child: Center(
//         child: BlocBuilder<CountryCodeCubit, BaseState>(
//           builder: (context, state) {
//             final cubit = CountryCodeCubit.of(context);
//             return GestureDetector(
//               onTap: () {
//                 cubit.onPressedShowBottomSheet(context);
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   cubit.selectedCountry == null
//                       ? SizedBox()
//                       : Text(
//                           cubit.selectedCountry!.callingCode,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 14),
//                           textDirection: TextDirection.ltr,
//                         ),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   cubit.selectedCountry == null
//                       ? const SizedBox()
//                       : Image.asset(
//                           cubit.selectedCountry!.flag,
//                           package: countryCodePackageName,
//                           width: 24,
//                           height: 24,
//                         ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
