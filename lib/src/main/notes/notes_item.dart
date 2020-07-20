import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';

class NotesItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:16.0,right: 16.0,top: 8.0),
      color: addNoteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Morbi pellentesque',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '18 Dec 2020',
                  style: TextStyle(fontSize: 16, color: darkGreyColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
