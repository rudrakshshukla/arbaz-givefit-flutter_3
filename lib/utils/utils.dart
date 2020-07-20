import 'package:flutter/material.dart';
import '../utils/color_utils.dart';
import 'localization/localization.dart';

class Utils {
  static bool isEmailValid(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  static InputDecoration styleInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      hasFloatingPlaceholder: false,
      labelStyle: styleTextStyleTextField(),
      counterText: "",
      border: OutlineInputBorder(),
    );
  }

  static InputDecoration styleInputDecorationIcon(String label, String icon) {
    return InputDecoration(
      labelText: label,
      hasFloatingPlaceholder: false,
      labelStyle: styleTextStyleTextField(),
      counterText: "",
      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          icon,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  static TextStyle styleTextStyleTextField() {
    return TextStyle(fontSize: 14, color: greyColor);
  }

  static String isValidEmail(BuildContext context, String value) {
    if (value.isEmpty) {
      return null;
    } else if (Utils.isEmailValid(value)) {
      return Localization.of(context).msgEnterValidAddress;
    } else {
      return null;
    }
  }

  static String isValidMobile(BuildContext context, String value) {
    if (value.isEmpty) {
      return null;
    } else if (value.length != 10) {
      return Localization.of(context).msgEnterValidMobile;
    } else {
      return null;
    }
  }

  static String isEmpty(BuildContext context,String value, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

}
