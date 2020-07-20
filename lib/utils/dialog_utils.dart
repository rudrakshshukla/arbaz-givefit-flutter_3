import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'dimens.dart';
import 'localization/localization.dart';

class DialogUtils {
  static void showOkCancelAlertDialog({
    BuildContext context,
    String message,
    String okButtonTitle,
    String cancelButtonTitle,
    Function okButtonAction,
    bool isCancelEnable = true,
  }) {
    // flutter defined function
    showDialog(
      barrierDismissible: isCancelEnable,
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return _showOkCancelCupertinoAlertDialog(context, message,
              okButtonTitle, cancelButtonTitle, okButtonAction, isCancelEnable);
        } else {
          return _showOkCancelMaterialAlertDialog(context, message,
              okButtonTitle, cancelButtonTitle, okButtonAction, isCancelEnable);
        }
      },
    );
  }

  static void showOkAlertDialog({
    BuildContext context,
    String message,
    String okButtonTitle = "Ok",
    Function okButtonAction,
    bool isCancelEnable = true,
  }) {
    // flutter defined function
    showDialog(
      barrierDismissible: isCancelEnable,
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return _showOkCancelCupertinoAlertDialog(context, message,
              okButtonTitle, null, okButtonAction, isCancelEnable);
        } else {
          return _showOkCancelMaterialAlertDialog(context, message,
              okButtonTitle, null, okButtonAction, isCancelEnable);
        }
      },
    );
  }

  static void showAlertDialog(BuildContext context, String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return _showCupertinoAlertDialog(context, message);
        } else {
          return _showMaterialAlertDialog(context, message);
        }
      },
    );
  }

  static CupertinoAlertDialog _showCupertinoAlertDialog(
      BuildContext context, String message) {
    return CupertinoAlertDialog(
      title: Text(Localization.of(context).appName),
      content: Text(message),
      actions: _actions(context),
    );
  }

  static AlertDialog _showMaterialAlertDialog(
      BuildContext context, String message) {
    return AlertDialog(
      title: Text(Localization.of(context).appName),
      content: Text(message),
      actions: _actions(context),
    );
  }

  static AlertDialog _showOkCancelMaterialAlertDialog(
      BuildContext context,
      String message,
      String okButtonTitle,
      String cancelButtonTitle,
      Function okButtonAction,
      bool isCancelEnable) {
    return AlertDialog(
      title: Text(Localization.of(context).appName),
      content: Text(message),
      actions: _okCancelActions(
          context: context,
          okButtonTitle: okButtonTitle,
          cancelButtonTitle: cancelButtonTitle,
          okButtonAction: okButtonAction,
          isCancelEnable: isCancelEnable),
    );
  }

  static CupertinoAlertDialog _showOkCancelCupertinoAlertDialog(
      BuildContext context,
      String message,
      String okButtonTitle,
      String cancelButtonTitle,
      Function okButtonAction,
      bool isCancelEnable) {
    return CupertinoAlertDialog(
        title: Text(Localization.of(context).appName),
        content: Text(message),
        actions: isCancelEnable
            ? _okCancelActions(
            context: context,
            okButtonTitle: okButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            okButtonAction: okButtonAction,
            isCancelEnable: isCancelEnable)
            : _okAction(
            context: context,
            okButtonAction: okButtonAction,
            okButtonTitle: okButtonTitle));
  }

  static List<Widget> _actions(BuildContext context) {
    return <Widget>[
      Platform.isIOS
          ? CupertinoDialogAction(
        child: Text("Ok"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
          : FlatButton(
        child: Text("Ok"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ];
  }

  static List<Widget> _okCancelActions(
      {BuildContext context,
        String okButtonTitle,
        String cancelButtonTitle,
        Function okButtonAction,
        bool isCancelEnable}) {
    return <Widget>[
      cancelButtonTitle != null
          ? Platform.isIOS
          ? CupertinoDialogAction(
        isDestructiveAction: true,
        child: Text(cancelButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
          : FlatButton(
        child: Text(cancelButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )
          : null,
      Platform.isIOS
          ? CupertinoDialogAction(
        child: Text(okButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
          okButtonAction();
        },
      )
          : FlatButton(
        child: Text(okButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
          okButtonAction();
        },
      ),
    ];
  }

  static List<Widget> _okAction(
      {BuildContext context, String okButtonTitle, Function okButtonAction}) {
    return <Widget>[
      Platform.isIOS
          ? CupertinoDialogAction(
        child: Text(okButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
          okButtonAction();
        },
      )
          : FlatButton(
        child: Text(okButtonTitle),
        onPressed: () {
          Navigator.of(context).pop();
          okButtonAction();
        },
      ),
    ];
  }

//  static Future<bool> displayToast(String message) {
//    return Fluttertoast.showToast(
//        msg: message,
//        toastLength: Toast.LENGTH_LONG,
//        gravity: ToastGravity.BOTTOM,
//        timeInSecForIos: 2,
//        backgroundColor: primaryColor,
//        textColor: Colors.white,
//        fontSize: fontMedium);
//  }

  static SnackBar displaySnackBar({String message}) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: fontMedium),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: primaryColor,
    );
  }
}
