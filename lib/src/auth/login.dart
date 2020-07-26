import 'dart:io';

import 'package:device_id/device_id.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:givefit/apis/api_manager.dart';
import 'package:givefit/utils/color_utils.dart';
import 'package:givefit/utils/constants.dart';
import 'package:givefit/utils/dialog_utils.dart';
import 'package:givefit/utils/navigation.dart';
import 'package:givefit/utils/preference_utils.dart';
import 'package:givefit/utils/progress_dialog.dart';
import 'package:givefit/widgets/custom_background.dart';
import 'package:givefit/widgets/input_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class LoginScreen extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  TextEditingController Passcontroller=TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(30.0),
              child: Image.asset('assets/images/ic_login.webp'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            InkWell(
              onTap: ()async {
                try{
                  final facebookLogin = FacebookLogin();
                  final result = await facebookLogin.logIn(['email']);
                  if (result.status == FacebookLoginStatus.loggedIn) {
                    FacebookAccessToken facebookAccessToken = result.accessToken;
                    final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);
                    final AuthResult user = await _auth.signInWithCredential(credential);
                    assert(user.user.email != null);
                    assert(user.user.displayName != null);
                    assert(!user.user.isAnonymous);
                    assert(await user.user.getIdToken() != null);
                    print(user.user);
                  }
                }catch(e)
                {

                }
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                color: facebookColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_facebook.png',
                    ),
                    Text(
                      'Sign In with Facebook',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
                final GoogleSignInAuthentication googleSignInAuthentication =
                await googleSignInAccount.authentication;

                final AuthCredential credential = GoogleAuthProvider.getCredential(
                  accessToken: googleSignInAuthentication.accessToken,
                  idToken: googleSignInAuthentication.idToken,
                );

                final AuthResult authResult = await _auth.signInWithCredential(credential);
                final FirebaseUser user = authResult.user;
                makeGoogleLogin(context,user);
                assert(!user.isAnonymous);
                assert(await user.getIdToken() != null);

                final FirebaseUser currentUser = await _auth.currentUser();
                assert(user.uid == currentUser.uid);

                return 'signInWithGoogle succeeded: $user';
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                color: googleColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_google.png',
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign In with Google',
                        style: TextStyle(fontSize: 18, color: googleTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                'OR',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 2,
              ),
              child: InputWidget(
                controller: Passcontroller,
                hint: 'Password',
                prefixIcon: 'assets/images/ic_password.png',
              ),
            ),
            GestureDetector(
              onTap: ()  {
                makeLogin(context);
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 40, bottom: 12),
                color: redColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'GO',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()  {
                NavigationUtils.push(context, routeAddPassword);

              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 40, bottom: 12),

                color: redColor,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign up',
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
  makeGoogleLogin(BuildContext context,FirebaseUser user) async {
    ProgressDialogUtils.showProgressDialog(context);
    String deviceId=await  DeviceId.getID;
    String deviceName=Platform.isAndroid?"A":"I";

    FormData req=FormData.fromMap({
      "email":user.email,
      "first_name":user.displayName,
      "last_name":"",
      "google_id":user.uid,
      "google_image":user.photoUrl,
      "device_type":deviceName,
      "device_id":deviceId,

    });
    try{
      var res=await ApiManager().googleSignIn(req);
      if(res.status)
      {
        ProgressDialogUtils.dismissProgressDialog();
        var pref=await initSharedPreferences();
        pref.setBool("isLogin", true);
        pref.setString("email", res.user.email);
        pref.setString("firstName", res.user.firstName);
        pref.setString("lastName", res.user.lastName);
        pref.setInt("userId", res.user.id);
        pref.setString("image", res.user.image);
        NavigationUtils.push(context, routeExercise);
      }
      else{
        ProgressDialogUtils.dismissProgressDialog();
        DialogUtils.displaySnackBar(message: res.message);

      }
    }catch(e)
    {
      ProgressDialogUtils.dismissProgressDialog();

    }
  }

  makeLogin(BuildContext context) async {
    ProgressDialogUtils.showProgressDialog(context);
    String deviceId=await  DeviceId.getID;
    String deviceName=Platform.isAndroid?"A":"I";

    FormData req=FormData.fromMap({
      "email":controller.text,
      "device_type":deviceName,
      "device_id":deviceId,
      "password":Passcontroller.text

    });
    try{
      var res=await ApiManager().loginUser(req);
      if(res.status)
      {
        ProgressDialogUtils.dismissProgressDialog();
        var pref=await initSharedPreferences();
        pref.setBool("isLogin", true);
        pref.setString("email", res.user.email);
        pref.setString("firstName", res.user.firstName);
        pref.setString("lastName", res.user.lastName);
        pref.setInt("userId", res.user.id);
        pref.setString("image", res.user.image);
        NavigationUtils.push(context, routeExercise);
      }
      else{
        ProgressDialogUtils.dismissProgressDialog();
        DialogUtils.displaySnackBar(message: res.message);

      }
    }catch(e)
    {
      ProgressDialogUtils.dismissProgressDialog();

    }
  }



}
