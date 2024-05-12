import 'package:flutter/material.dart';

import '../../localization/appLocale.dart';
import '../../theme/color_app.dart';

class IconApp {
  static Widget back_forward_icon(BuildContext context) {
    String lang = AppLocale.of(context).locale.languageCode;
    return Icon(
      lang == "en" ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
      color: ColorApp.black,
      size: 18,
    );
  }
}
