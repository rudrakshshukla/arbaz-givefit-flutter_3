import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';

class CommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Text(
            'C',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0),
                margin: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Callie Hodges',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '06 Oct 2020',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: Text(
                  'In hac habitasse platea dictumst. Sed vulputate id ipsum vel mollis. Donec cursus luctus ligula. ',
                  style: TextStyle(fontSize: 16.0, color: grayColor),
                ),
              ),
              Divider(
                color: grayColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
