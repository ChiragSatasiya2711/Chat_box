import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/screen/home_page_screen.dart';
import 'package:chat_box/presentation/screen/one_boarding_screen.dart';
import 'package:chat_box/utils/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalController global = Get.put(GlobalController());
  @override
  nextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (global.user != null && global.user!.emailVerified) {
          Get.off(HomePageScreen());
        } else {
          Get.off(OneBoardingScreen());
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    global.user = FirebaseAuth.instance.currentUser;
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppText.c,
              style: TextStyle(fontSize: width * 0.28, color: const Color(0xee24786D), fontWeight: FontWeight.bold),
            ),
            Text(
              AppText.chatbox,
              style: TextStyle(fontSize: width * 0.1, fontWeight: FontWeight.w500, fontFamily: "circular"),
            ),
          ],
        ),
      ),
    );
  }
}
