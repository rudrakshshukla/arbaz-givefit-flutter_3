import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String icon;
  final String title;

  const MenuItem({Key key, @required this.icon, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32.0, right: 32.0),
      child: ListTile(
        leading: Image.asset(
          icon,
          width: 25,
          height: 25,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
