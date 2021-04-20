import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealsapp/screens/setup_user_profile.dart';
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/exotic.jpeg",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 40.h,
            right: 40.h,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      User _firebaseUser =
                          await FirebaseAuthHelper().signInWithGoogle();
                      _saveUserToHive(_firebaseUser, _userBox);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SetupUserProfile.routeName,
                        (Route<dynamic> route) => false,
                      );
                    } catch (error) {
                      print('Error: $error');
                    }
                  },
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(
                        left: 30.h,
                        right: 30.h,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 160.h,
            left: 40.h,
            right: 40.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Meal Bible !',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 23.h,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Get over a hundred beautiful and',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'delicious recipes in Ghana',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 18.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[200],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
