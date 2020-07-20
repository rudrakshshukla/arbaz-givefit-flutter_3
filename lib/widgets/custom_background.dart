import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final Widget appBar;

  const CustomBackground({Key key, this.child, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_background.webp'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar!=null ? PreferredSize(
            preferredSize: Size.fromHeight(55.0),child: appBar) : null,
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
