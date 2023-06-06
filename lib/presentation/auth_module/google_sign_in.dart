import 'package:chat_box/presentation/screen/home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    try {
      final GoogleSignInAuthentication googleauth = await googleSignInAccount!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken,
        idToken: googleauth.idToken,
      );
      final accessToken = googleauth.accessToken;
      final refreshToken = googleauth.idToken;
      if (accessToken!.isEmpty || accessToken == null) {
        return "Pleass enter Gmail";
      } else {
        Get.off(HomePageScreen());
        Fluttertoast.showToast(
          msg: "This is Login success full",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      debugPrint("====>  accessToken  === > $accessToken");
      debugPrint("====>  refreshToken   === > $refreshToken");

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print("Google Sign In Error == $error");
    }
  }
}
