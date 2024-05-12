// import 'package:country_calling_code_picker/country.dart';
// import 'package:country_calling_code_picker/functions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:souq_eletara/core/routes/navigator_push.dart';
// import 'package:souq_eletara/core/widgets/main_text.dart';
// import '../../../../../core/state/base_state.dart';
// import '../../../../../core/theme/color_app.dart';
// import '../../page_dimensions/app_padding.dart';
// import '../../theme/textFont_app.dart';
//
// class CountryCodeCubit extends Cubit<BaseState> {
//   CountryCodeCubit() : super(InitState());
//
//   static CountryCodeCubit of(context) => BlocProvider.of(context);
//
//   Country? selectedCountry;
//
//   void initCountry(BuildContext? context) async {
//     final country = await getDefaultCountry(context!);
//     selectedCountry = country;
//     emit(InitState());
//   }
//
//   void onPressedShowBottomSheet() async {
//     final country = await showCountryPickerSheet(
//       RouteManager.currentContext,
//       title: Padding(
//         padding: const EdgeInsets.all(AppPadding.innerItemPadding),
//         child: MainText(
//           text:'أختر الدولة',
//           font: 16,
//           family: TextFontApp.mediumFont,
//           // style: TextStyleApp.titleStyle,
//         ),
//       ),
//       cancelWidget: Padding(
//         padding:  EdgeInsets.all(AppPadding.innerItemPadding),
//         child: InkWell(
//           onTap: () {
//             RouteManager.pop();
//           },
//           child: Icon(
//             Icons.close,
//             color: ColorApp.grey,
//           ),
//         ),
//       ),
//       cornerRadius: 25,
//     );
//     if (country != null) {
//       selectedCountry = country;
//     }
//     emit(InitState());
//   }
// }
