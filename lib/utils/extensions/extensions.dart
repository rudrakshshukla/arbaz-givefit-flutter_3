import 'package:flutter/material.dart';

import '../color_utils.dart';

Widget getImageItems(
        {double width,
        double height,
        @required String imageUrl,
        @required EdgeInsets margin}) =>
    Container(
      margin: margin,
      width: width,
      height: height,
      child: DecoratedBox(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
        decoration: BoxDecoration(color: Colors.transparent),
      ),
    );


class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

BoxDecoration getWhiteBoxDecoration() => BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: greyColor,
        width: 0.5,
      ),
    );

BoxDecoration getBlueBoxDecoration() => BoxDecoration(
      color: Colors.blue,
      border: Border.all(
        color: accentColor,
        width: 0.5,
      ),
    );

BoxDecoration getBlueBoxWithBorderDecoration() => BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: accentColor,
        width: 0.5,
      ),
    );

Widget items(String label, String value, String icon) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: valueColor),
            ),
          )
        ],
      ),
      Image.asset(icon)
    ],
  ),
);