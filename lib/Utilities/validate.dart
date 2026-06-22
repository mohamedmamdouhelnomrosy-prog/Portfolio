import 'package:flutter/material.dart';

class Validate {
  static String? validatePassword(String? password) {
    //var passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if ((password?.length ?? 0) >= 8 /*&& passwordRegExp.hasMatch(password)*/) {
      return null;
    } else {
      return "";
    }
  }

  static String? validateNewPassword(
    String? newPassword,
  ) {
    print(newPassword);
    newPassword ??= '';
    var passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (newPassword.length >= 6 && passwordRegExp.hasMatch(newPassword)) {
      return "";
    } else {
      return null;
    }
  }

  static String? validateConfPassword({
    required String newPassword,
    required String confPassword,
  }) {
    print('5555555555555555555555555 $newPassword $confPassword');
    if (newPassword.characters == confPassword.characters) {
      return null;
    } else {
      return "";
    }
  }

/*
  static String? validatePhone(String phone) {
    if (phone.isEmpty) return Strings.enterYourPhone.translate;
    return null;
  } */

  static String? validateEmail(String? email) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if ((email?.isEmpty ?? true) ||
        !regex.hasMatch(email?.toLowerCase().trim() ?? '')) {
      return "";
    }
    return null;
  }

  static String? validateNormalString(String? text) {
    if (text?.isEmpty ?? true) return "";
    return null;
    if (text?.isEmpty ?? true) return "";
    return null;
  }

  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  static String? validateNumber(String? text) {
    if (text?.isEmpty ?? true) {
      return "";
    } else if (!isNumeric(text ?? '')) {
      return "";
    }
    return null;
  }

  static String? validateDropDown(dynamic value) {
    if (value == null || value.toString().isEmpty) return '';
    return null;
  }

  static String? validateURL(String? url) {
    if (url == null || url.isEmpty) {
      return '';
    }
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    var urlRegExp = RegExp(pattern);
    if (urlRegExp.hasMatch(url)) {
      return null;
    } else {
      return '';
    }
  }
}
