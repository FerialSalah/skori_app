import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

import '../../generated/locale_keys.g.dart';

abstract class Validations {
  static const String _NationalId = r'^[1|2]{1}[0-9]{9}$';
  static const String _visaNoRegExp = r'^(?:[0-9])?[0-9]{16}$';
  static const String _cvvNoRegExp = r'^(?:[0-9])?[0-9]{3}$';


  static String? validateField(value) {
    if (value.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }else{
      return null;
    }
  }

  static String? validateOtp(value) {
    if (value.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }else{
      return null;
    }
  }


  static String? validateNationalId(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }else if(value.trim().length<10){
      return  '';
    }else if(!RegExp(_NationalId).hasMatch(value.trim())){
      return "";
    }else{
      return null;
    }
  }
  static String? validateEmail(value) {
    if (value.trim().isEmpty) {
      //return StringConstants.ERROR_EMAIL;
      // return Locales.string(
      //     NavigationService.navigatorKey.currentContext!, 'err_email');
      return LocaleKeys.emptyField.tr();
    } else if (!EmailValidator.validate(value.trim())) {
      return LocaleKeys.emailIsInvalid.tr();;
      // return Locales.string(
      //     NavigationService.navigatorKey.currentContext!, 'err_valid_email');
    } else {
      return null;
    }
  }

  static String? validatePhone(String? mobileNo) {
    // if (!RegExp(_phoneNoRegExp).hasMatch(mobileNo)) return 'Invalid phone number.';
    if (mobileNo!.trim().startsWith('0')) {
      if (mobileNo.trim().length < 11) {
        // return LocaleKeys.phoneIsInvalid.tr();
      }
    } else {
      if (mobileNo.trim().length < 9) {
        // return LocaleKeys.phoneIsInvalid.tr();
      }
    }
    if (!RegExp(r'^(?:[0-9])').hasMatch(mobileNo))
      // return LocaleKeys.phoneIsInvalid.tr();
    // if (mobileNo.length != 11) return 'Mobile No must have 11 digits.';
    return null;
  }


  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }else if (value.length<8){
      return LocaleKeys.passwordL.tr();
    }else{
      return null;
    }
  }


  static String? validateConfirmPassword(String? value,String? password) {
    if (value!.isEmpty) {
      return LocaleKeys.emptyField.tr();
    }else if (value != password){
      return "password confirmation does not match ";
    }else{
      return null;
    }
  }

}
