import 'dart:convert';
import 'dart:io';

import 'package:device_id/device_id.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
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
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
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
            GestureDetector(
              onTap: (){
                fbLogin(context);
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
            GestureDetector(
              onTap: (){
                googleSignInFn(context);
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
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 2,
              ),
              child: InputWidget(
                controller: controller,
                hint: 'Enter your Email Address',
                prefixIcon: 'assets/images/ic_email.png',
              ),
            ),
            GestureDetector(
              onTap: () {
                makeLogin(context);
              },
              child: Container(
                width: 250,
                height: 50,
                margin: EdgeInsets.only(top: 40, bottom: 100),
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
          ],
        ),
      ),
    );
  }

  makeLogin(BuildContext context) async {
    ProgressDialogUtils.showProgressDialog(context);
    String deviceId = await DeviceId.getID;
    String deviceName = Platform.isAndroid ? "A" : "I";

    FormData req = FormData.fromMap({
      "email": controller.text,
      "device_type": deviceName,
      "device_id": deviceId
    });
    try {
      var res = await ApiManager().loginUser(req);
      if (res.status) {
        ProgressDialogUtils.dismissProgressDialog();
        NavigationUtils.push(context, routeExercise);
      } else {
        ProgressDialogUtils.dismissProgressDialog();
        NavigationUtils.push(context, routeAddPassword);
      }
    } catch (e) {
      DialogUtils.displaySnackBar(message: "Please try again");
      ProgressDialogUtils.dismissProgressDialog();
    }
  }

  googleSignInFn(BuildContext context)async{
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

  fbLogin(BuildContext context) async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        {
          final token = result.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,first_name,picture,last_name,email&access_token=${token}');
          final profile = json.decode(graphResponse.body);
          ApiManager apiManager = ApiManager();

          String deviceId = await DeviceId.getID;
          String deviceName = Platform.isAndroid ? "A" : "I";

          FormData req = FormData.fromMap({
            "device_type": deviceName,
            "device_id": deviceId,
            "first_name":profile["fist_name"],
            "last_name":profile["last_name"],
            "email":profile["email"],
            "facebook_id":profile["id"],
            "facebook_image":profile["picture"]["data"]["url"]
          });
        ProgressDialogUtils.showProgressDialog(context);

          var response = await apiManager.loginUserFb(req);
        ProgressDialogUtils.dismissProgressDialog();

          NavigationUtils.push(context, routeHome);

        }
        break;
      case FacebookLoginStatus.cancelledByUser:
      DialogUtils.displaySnackBar(message: 'Something went wrong...');

        break;
      case FacebookLoginStatus.error:
      DialogUtils.displaySnackBar(message: 'Something went wrong...');

        break;
    }
  }
}
