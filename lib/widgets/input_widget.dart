import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final String prefixIcon;
  final TextEditingController controller;
  final bool obscureText = false;

  const InputWidget({
    Key key,
    bool obscureText,
    this.controller,
    @required this.hint,
    @required this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 32.0,
        right: 32.0,
//          bottom: MediaQuery.of(context).viewInsets.bottom/2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller:controller,
            obscureText: obscureText,
            style: TextStyle(color: hintEditTextColor),
            decoration: InputDecoration(
              hintText: hint,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: valueColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: valueColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: valueColor),
              ),
              icon: Image.asset(
                prefixIcon,
                width: 20,
                height: 20,
              ),
              hintStyle: TextStyle(
                fontSize: 20.0,
                color: hintEditTextColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
