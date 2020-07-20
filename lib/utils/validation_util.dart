import 'package:flutter/material.dart';

import 'constants.dart';
import 'localization/localization.dart';

String isValidEmail(BuildContext context, String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);

  if (value.isEmpty) {
    return Localization.of(context).msgEnterAddress;
  } else if (!regex.hasMatch(value.trim())) {
    return Localization.of(context).msgEnterValidAddress;
  } else {
    return null;
  }
}

String isValidEmailOptional(BuildContext context, String value) {
  if (value.isEmpty) {
    return null;
  }
  return isValidEmail(context, value);
}

String isValidName(BuildContext context, String value) {
  if (value.isEmpty) {
    return Localization.of(context).msgEnterName;
  } else if (value.trim().length < 2) {
    return Localization.of(context).msgEnterValidName;
  } else {
    return null;
  }
}


String isValidNumber(BuildContext context, String value) {
  final pattern = RegExp(r'^[0-9]+$');

  if (value.trim().isEmpty) {
    return Localization.of(context).msgEnterMobile;
  } else if (!pattern.hasMatch(value.trim()) || value.trim().length < 10) {
    return Localization.of(context).msgEnterValidMobile;
  } else {
    return null;
  }
}

String isValidPassCode(BuildContext context, String value) {
  if (value.trim().isEmpty) {
    return Localization.of(context).msgEnterPassCode;
  } else if (value.trim().length < 6) {
    return Localization.of(context).msgEnterValidPassCode;
  } else {
    return null;
  }
}

String isValidVerificationCode(BuildContext context, String value) {
  if (value.trim().isEmpty) {
    return Localization.of(context).msgEnterPassCode;
  } else if (value.trim().length < 6) {
    return Localization.of(context).msgVerificationCode;
  } else {
    return null;
  }
}

String isValidConfirmPassCode(
    BuildContext context, String newPassword, String oldPassword) {
  if (newPassword.trim().isEmpty) {
    return Localization.of(context).msgEnterConfirmPassCode;
  } else if (newPassword.trim() != oldPassword.trim()) {
    return Localization.of(context).msgEnterValidConfirmPassCode;
  } else {
    return null;
  }
}





String formatMobileNumber(String value) {
  var formatNumber = value.replaceAll(RegExp(r'[^+\d]+'), '');

  if (formatNumber.indexOf("+") == -1 &&
      formatNumber.indexOf(defaultCountryCode) == -1) {
    return defaultCountryCode + formatNumber;
  }

  return formatNumber;
}
