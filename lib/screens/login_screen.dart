import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:mealsapp/models/user_model.dart';
import 'package:mealsapp/services/firebase_auth_helper.dart';
import 'package:mealsapp/utils/screen_sizes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  void _saveUserToHive(User _firebaseUser, Box<UserModel> _userBox) {
    final UserModel userModel = UserModel(
      uid: _firebaseUser.uid,
      displayName: _firebaseUser.displayName,
      photoUrl: _firebaseUser.photoURL,
      emailId: _firebaseUser.email,
    );
    print('Saving user ${userModel.displayName}');
    _userBox.add(userModel);
  }

  @override
  Widget build(BuildContext context) {
    final Box<UserModel> _userBox = Provider.of<Box<UserModel>>(context);
    ScreenUtil.init(
      context,
      designSize: Size(
        MyScreenSizes.screenWidth,
        MyScreenSizes.screenHeight,
      ),
      allowFontScaling: true,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 481.h,
              width: 452.h,
              child: Image.asset('assets/images/chef.png'),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 25.h, right: 25.h),
              child: Text(
                '1K + LOCAL RECIPES',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 25.h, right: 25.h),
              child: Text(
                'It\'s\nCooking\nTime!',
                style: TextStyle(
                    color: Theme.of(context).canvasColor,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 25.h, right: 25.h),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    User _firebaseUser =
                        await FirebaseAuthHelper().signInWithGoogle();
                    _saveUserToHive(_firebaseUser, _userBox);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (Route<dynamic> route) => false,
                    );
                  } catch (error) {
                    print('Error: $error');
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FlutterIcons.google_ant,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  enableFeedback: true,
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(
                          left: 30.h, right: 30.h, top: 20.h, bottom: 20.h)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0.h),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
