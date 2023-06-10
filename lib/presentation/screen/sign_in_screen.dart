import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/auth_module/google_sign_in.dart';
import 'package:chat_box/presentation/screen/home_page_screen.dart';
import 'package:chat_box/utils/App_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class SignINScreen extends StatefulWidget {
  const SignINScreen({Key? key}) : super(key: key);

  @override
  State<SignINScreen> createState() => _SignINScreenState();
}

class _SignINScreenState extends State<SignINScreen> {
  final _formKey = GlobalKey<FormState>();

  GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: AppColor.black,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppText.logChatbox,
                          style: TextStyle(fontSize: width * 0.042, fontWeight: FontWeight.w600, height: 5),
                        ),
                        Text(
                          AppText.welcomback,
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColor.black10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.06),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImage.facebook, scale: 0.8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                              child: GestureDetector(
                                onTap: () async {
                                  await AuthService().signInWithGoogle();
                                },
                                child: Image.asset(AppImage.google, scale: 0.8),
                              ),
                            ),
                            Image.asset(AppImage.apple, scale: 0.8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.black10,
                            endIndent: 12,
                            indent: 12,
                          ),
                        ),
                        Text(
                          AppText.or,
                          style: TextStyle(
                            color: AppColor.black10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColor.black10,
                            indent: 12,
                            endIndent: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.black10),
                            ),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (global.emailController.text.isEmpty) {
                                return "Please enter Email";
                              } else if (global.emailController.text.isEmail == false) {
                                return "Please verified email";
                              } else {
                                null;
                              }
                            },
                            controller: global.emailController,
                            decoration: InputDecoration(
                                labelText: AppText.email,
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.perple,
                                ),
                                enabledBorder: InputBorder.none),
                            style: TextStyle(color: AppColor.black10, fontSize: 18, height: 1.5),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.black10),
                            ),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: global.passwordController,
                            validator: (value) {
                              if (global.passwordController.text.isEmpty) {
                                return "Please enter Password";
                              } else {
                                null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: AppText.psd,
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.perple,
                                ),
                                enabledBorder: InputBorder.none),
                            style: TextStyle(color: AppColor.black, fontSize: 18, height: 1.5),
                          ),
                        ),
                        SizedBox(height: height * 0.2),
                        Container(
                          height: height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.perple,
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                loginUser();
                              }
                            },
                            child: Text(
                              AppText.login,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: width * 0.046,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          AppText.forpsd,
                          style: TextStyle(
                            fontSize: width * 0.032,
                            height: 2.4,
                            color: AppColor.perple,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: global.emailController.text,
        password: global.passwordController.text,
      );

      global.user = FirebaseAuth.instance.currentUser;

      debugPrint("User data --------->> ${global.user}");
      if (global.user != null) {
        debugPrint("======__________----><.${global.user!.emailVerified}");
        Get.off(HomePageScreen());
        global.emailController.clear();
        global.passwordController.clear();
        Fluttertoast.showToast(
          msg: "This is Login success full",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else
        null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        debugPrint('The email provided is wrong.');
      } else if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        return Fluttertoast.showToast(
          msg: "This is User Is Not create",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        return Fluttertoast.showToast(
          msg: "This is Password is wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else if (e.code == 'unknown') {
        debugPrint('Please provide email and password');
      }
      print(e.message);
    }
  }
}
