import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';
import 'package:givefit/widgets/input_widget.dart';

class AddPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            NavigationUtils.pop(context);
          },
          child: Image.asset(
            'assets/images/ic_back.png',
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
//              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(30.0),
              child: Image.asset('assets/images/ic_login.webp'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            InputWidget(
              hint: 'Password',
              obscureText: true,
              prefixIcon: 'assets/images/ic_password.png',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: InputWidget(
                obscureText: true,
                hint: 'Confirm Password',
                prefixIcon: 'assets/images/ic_password.png',
              ),
            ),
            GestureDetector(
              onTap: (){
                NavigationUtils.pushAndRemoveUntil(context, routeExercise);
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 40,bottom: 100),
                color: redColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      'GO',
                    style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
