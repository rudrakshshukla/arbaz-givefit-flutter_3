import 'package:flutter/material.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/widgets/custom_background.dart';
import 'package:givefit/widgets/input_widget.dart';

class InstantLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(30.0),
              child: Image.asset('assets/images/ic_login.webp'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome back!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://picsum.photos/400/500'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Mavya Soni',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            InputWidget(
              hint: 'Password',
              obscureText: true,
              prefixIcon: 'assets/images/ic_password.png',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 16, color: redColor),
                ),
                onPressed: () {},
              ),
            ),
            GestureDetector(
              onTap: (){
                NavigationUtils.pushAndRemoveUntil(context, routeExercise);
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(bottom: 100),
                color: redColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
