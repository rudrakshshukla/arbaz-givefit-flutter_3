import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: addNoteColor,
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(16.0),
              child: Image.asset('assets/images/ic_clock.png')),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Workout\nCompleted',
              style: TextStyle(
                fontSize: 18,
                textBaseline: TextBaseline.ideographic,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '16 Mar 2020',
              style: TextStyle(
                fontSize: 16,
                color: redColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
