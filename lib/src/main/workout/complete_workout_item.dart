import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';

class CompleteWorkoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:16.0,right: 16.0,top: 8.0),
      color: addNoteColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '16 Mar 2020',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:8.0,right: 8.0 ),
                  child: Image.asset('assets/images/ic_core.png',width: 25,height: 25,),
                ),
                Container(
                  margin: EdgeInsets.only(top:8.0,right: 8.0 ),
                  child: Text(
                    'Core Exercise',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
