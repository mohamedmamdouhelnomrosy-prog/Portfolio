import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utilities/shared_preferences.dart';

enum Languages { en, ar }

Languages appLan({BuildContext? context}) =>
    context?.read<AppLanguage>().appLang ?? Languages.en;

bool appLangIsArabic({BuildContext? context}) => appLan() == Languages.ar;

class AppLanguage extends Cubit<Languages> {
  Languages _appLanguage = Languages.en;

  AppLanguage() : super(Languages.en);

  Languages get appLang => _appLanguage;

  Future fetchLocale(BuildContext context) async {
    if (SharedPref.getLanguage() == null) {
      _appLanguage = Languages.values.firstWhereOrNull((lang) =>
              View.of(context)
                  .platformDispatcher
                  .locale
                  .languageCode
                  .contains(lang.name)) ??
          _appLanguage;
    } else {
      _appLanguage = Languages.values
          .firstWhere((lang) => lang.name == SharedPref.getLanguage());
    }
  }

  Future changeLanguage({Languages? language}) async {
    if (language == _appLanguage) return;
    emit(state);
    switch (language) {
      case Languages.en:
        _appLanguage = Languages.en;
        break;
      case Languages.ar:
        _appLanguage = Languages.ar;
        break;
      case null:
        _appLanguage =
            _appLanguage == Languages.ar ? Languages.en : Languages.ar;
        break;
    }
    await SharedPref.setLanguage(lang: _appLanguage.name);
    Future.delayed(const Duration(milliseconds: 100)).then((e) {
      emit(state);
    });
  }
}
