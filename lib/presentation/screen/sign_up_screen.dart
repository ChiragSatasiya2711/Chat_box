import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/screen/home_page_screen.dart';
import 'package:chat_box/utils/App_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            top: true,
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(
                    color: AppColor.black,
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppText.signemail,
                          style: TextStyle(fontSize: width * 0.042, fontWeight: FontWeight.w600, height: 5),
                        ),
                        Text(
                          AppText.getchating,
                          style: TextStyle(
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: AppColor.black10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.06),
                      ],
                    ),
                  ),
                  Row(
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
                            controller: global.nameController,
                            validator: (value) {
                              if (global.nameController.text.isEmpty) {
                                return "Please enter Name";
                              } else if (global.emailController.text.isEmail == false) {
                                return "Please verified email";
                              } else {
                                null;
                              }
                            },
                            decoration: InputDecoration(
                                labelText: AppText.name,
                                labelStyle: const TextStyle(
                                  color: Color(0xFF24786D),
                                ),
                                enabledBorder: InputBorder.none),
                            cursorHeight: 25,
                            style: TextStyle(color: AppColor.black, fontSize: 14, height: 1.5),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.black10),
                            ),
                          ),
                          child: TextFormField(
                            controller: global.emailController,
                            validator: (value) {
                              if (global.emailController.text.isEmpty) {
                                return "Please enter Email";
                              } else {
                                null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: AppText.email,
                                labelStyle: TextStyle(
                                  color: AppColor.perple,
                                ),
                                enabledBorder: InputBorder.none),
                            cursorHeight: 25,
                            style: TextStyle(color: AppColor.black, fontSize: 14, height: 1.5),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.black10),
                            ),
                          ),
                          child: TextFormField(
                            controller: global.psdController,
                            validator: (value) {
                              if (global.psdController.text.isEmpty) {
                                return "Please enter Password";
                              } else {
                                null;
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: AppText.psd,
                                labelStyle: const TextStyle(
                                  color: Color(0xFF24786D),
                                ),
                                enabledBorder: InputBorder.none),
                            cursorHeight: 25,
                            style: TextStyle(color: AppColor.black, fontSize: 14, height: 1.5),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColor.black10),
                            ),
                          ),
                          child: TextFormField(
                            controller: global.cpsdController,
                            validator: (value) {
                              if (global.cpsdController.text.isEmpty) {
                                return "Please enter Conform Password";
                              } else if (global.psdController.text != global.cpsdController.text) {
                                return "Please enter Same Password";
                              } else {
                                null;
                              }
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: AppText.cpsd,
                                labelStyle: TextStyle(
                                  color: AppColor.perple,
                                ),
                                enabledBorder: InputBorder.none),
                            cursorHeight: 25,
                            style: TextStyle(color: AppColor.black, fontSize: 14, height: 1.5),
                          ),
                        ),
                        SizedBox(height: height * 0.14),
                        Container(
                          height: height * 0.06,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColor.perple,
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                userSignUp();
                                global.nameController.clear();
                                global.emailController.clear();
                                global.psdController.clear();
                                global.cpsdController.clear();
                                Get.to(const HomePageScreen());
                              }
                            },
                            child: Text(
                              AppText.craccount,
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: width * 0.042,
                              ),
                            ),
                          ),
                        ),
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

  userSignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: global.emailController.text,
        password: global.psdController.text,
      );

      global.user = FirebaseAuth.instance.currentUser;
      debugPrint("User data --------->> $global.user");

      Get.off(HomePageScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
