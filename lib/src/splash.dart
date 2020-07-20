import 'dart:async';

import 'package:flutter/material.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/img_splash.webp'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _startTime() async {
    final _duration = Duration(seconds: splashTime);
    return Timer(_duration, _gotoNextScreen);
  }

  void _gotoNextScreen() {
    NavigationUtils.pushReplacement(context, routeLogin);
  }

  @override
  void initState() {
    super.initState();
    _startTime();
  }
}
