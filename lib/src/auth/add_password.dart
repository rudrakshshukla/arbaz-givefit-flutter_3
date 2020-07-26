import 'dart:io';

import 'package:device_id/device_id.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:givefit/apis/api_manager.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/dialog_utils.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/utils/preference_utils.dart';
import 'package:givefit/widgets/custom_background.dart';
import 'package:givefit/widgets/input_widget.dart';
import 'package:givefit/utils/progress_dialog.dart';

class AddPasswordScreen extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  TextEditingController Passcontroller=TextEditingController();
  TextEditingController ConformPasscontroller=TextEditingController();

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
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: InputWidget(
                controller: controller,
                hint: 'Enter your Email Address',
                prefixIcon: 'assets/images/ic_email.png',
              ),
            ),

            InputWidget(
              controller: Passcontroller,
              hint: 'Password',
              obscureText: true,
              prefixIcon: 'assets/images/ic_password.png',
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: InputWidget(
                controller: ConformPasscontroller,
                obscureText: true,
                hint: 'Confirm Password',
                prefixIcon: 'assets/images/ic_password.png',
              ),
            ),
            GestureDetector(
              onTap: (){
                userSignUp(context);
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

  userSignUp(BuildContext context) async {

    if(Passcontroller.text == ConformPasscontroller.text)
    {
      ProgressDialogUtils.showProgressDialog(context);
      String deviceId=await  DeviceId.getID;
      String deviceName=Platform.isAndroid?"A":"I";

      FormData req=FormData.fromMap({
        "email":controller.text,
        "device_type":deviceName,
        "device_id":deviceId,
        "password":Passcontroller.text
      });

      var res=await ApiManager().SignInUser(req);
      if(res.status)
      {
        var pref=await initSharedPreferences();
        pref.setBool("isLogin", true);
        pref.setString("email", res.user.email);
        pref.setString("firstName", res.user.firstName);
        pref.setString("lastName", res.user.lastName);
        pref.setInt("userId", res.user.id);
        pref.setString("image", res.user.image);



        ProgressDialogUtils.dismissProgressDialog();

        NavigationUtils.pushReplacement(context, routeExercise);
      }
      else{
        ProgressDialogUtils.dismissProgressDialog();
        DialogUtils.showAlertDialog(context, res.message);

      }


    }else{
      DialogUtils.showAlertDialog(context, "Please enter conform password same as password");

    }

  }
}
