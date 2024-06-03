import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/color_app.dart';
import '../validations.dart';

class PinCodeFieldApp extends StatelessWidget {
  final Function(String)? onCompleteFunction;
  final TextEditingController? textEditingController;
  const PinCodeFieldApp(
      {super.key,
      required this.onCompleteFunction,
       this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        controller: textEditingController,
        appContext: context,
        validator: Validations.validateOtp,
        cursorColor:ColorApp.primary ,
        keyboardType: TextInputType.number,
        length: 6,
        errorTextSpace: 30,
        onCompleted: onCompleteFunction,
        onChanged: (value) => print("----${value}"),
        pinTheme: PinTheme(
            activeColor: ColorApp.primary,
            selectedColor: ColorApp.primary,
            inactiveColor: ColorApp.primary),
      ),
    );
  }
}
