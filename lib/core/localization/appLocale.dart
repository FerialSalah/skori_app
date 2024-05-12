// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocale {
  Locale locale;
  AppLocale({required this.locale});
  late Map<String, String> _loadedlocalizedValues;

  static AppLocale of(BuildContext context) {
    return Localizations.of(context, AppLocale);
  }

  Future loadLang() async {
    String _langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> _loadedValues = jsonDecode(_langFile);
    _loadedlocalizedValues = _loadedValues.map(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
  }

  String getTranslation(String key) {
    return _loadedlocalizedValues[key]!;
  }

  static const LocalizationsDelegate<AppLocale> delegate = _AppLocalDelegate();
}

class _AppLocalDelegate extends LocalizationsDelegate<AppLocale> {
  const _AppLocalDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocale> load(Locale locale) async {
    AppLocale appLocale = AppLocale(locale: locale);
    await appLocale.loadLang();
    return appLocale;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocale> old) => false;
}
