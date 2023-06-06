import 'package:chat_box/presentation/screen/one_boarding_screen.dart';
import 'package:chat_box/utils/App_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      return Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OneBoardingScreen(),
          ),
          (route) => false);
    });
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
