import 'package:flutter/material.dart';
import 'package:qassim/core/utils/app_localization.dart';

abstract final class ValidateCheck {
  static bool validate(GlobalKey<FormState> formKey){
    return formKey.currentState!.validate();
  }

  static String? validateEmail(
    String? value,
    BuildContext context,
  ) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final kEmailValid = RegExp(pattern);
    bool isValid = kEmailValid.hasMatch(value.toString());
    if (value!.isEmpty) {
      return '\u26A0 ${AppLocalizations.of(context).translate('email_is_required')}';
    } else if (isValid == false) {
      return '\u26A0 ${AppLocalizations.of(context).translate(
        "invalid_email_address",
      )}';
    }
    return null;
  }

  static String? validateEmptyText(
      String? value, BuildContext context, String? message) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).translate(message!);
    }
    return null;
  }

  static String? validatePassword(
      String? value, BuildContext context,) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).translate(
        'password_is_required',
      );
    } else if (value.length < 8) {
        return AppLocalizations.of(context).translate(
          'password_chars_is_not_valid',
      );
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, BuildContext context, String? password) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context).translate(
        'confirm_password_required',
      );
    } else if (value != password) {
      return AppLocalizations.of(context).translate(
        'confirm_password_not_matched',
      );
    }
    return null;
  }
}
