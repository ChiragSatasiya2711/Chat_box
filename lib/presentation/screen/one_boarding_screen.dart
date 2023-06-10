import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:chat_box/presentation/auth_module/google_sign_in.dart';
import 'package:chat_box/presentation/screen/home_page_screen.dart';
import 'package:chat_box/presentation/screen/sign_in_screen.dart';
import 'package:chat_box/presentation/screen/sign_up_screen.dart';
import 'package:chat_box/utils/app_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_keyhash/flutter_facebook_keyhash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

import '../../utils/App_text.dart';
import '../../utils/app_color.dart';

class OneBoardingScreen extends StatefulWidget {
  const OneBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OneBoardingScreen> createState() => _OneBoardingScreenState();
}

class _OneBoardingScreenState extends State<OneBoardingScreen> {
  String country = "";
  GlobalController global = Get.put(GlobalController());
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    printKeyHash();
  }

  void printKeyHash() async {
    print('-----');
    String? key = await FlutterFacebookKeyhash.getFaceBookKeyHash ?? 'Unknown platform version';
    print(key ?? "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImage.secbk), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.09),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.05),
                    child: Center(
                      child: Image.asset(
                        AppImage.secLogo,
                        scale: 0.8,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: AppText.connect,
                      style: TextStyle(color: AppColor.white, fontSize: width * 0.18, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: AppText.quickly,
                          style: TextStyle(color: AppColor.white, fontSize: width * 0.18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppText.connected,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.w400,
                      height: 2,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await signInWithFacebook();
                        },
                        child: Image.asset(AppImage.facebook),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: GestureDetector(
                          onTap: () async {
                            await AuthService().signInWithGoogle();
                          },
                          child: Image.asset(AppImage.google),
                        ),
                      ),
                      Image.asset(AppImage.apple),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.06),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size.width),
                          border: Border.all(color: AppColor.white),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.call_sharp,
                            color: AppColor.white,
                          ),
                          onPressed: () {
                            showModle();
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.03),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.white60,
                            endIndent: 12,
                          ),
                        ),
                        Text(
                          AppText.or,
                          style: TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.white60,
                            indent: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => Get.to(const SignUpScreen()),
                          child: Text(
                            AppText.mail,
                            style: TextStyle(fontWeight: FontWeight.w500, color: AppColor.black, fontSize: width * 0.044),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  GestureDetector(
                    onTap: () => Get.to(const SignINScreen()),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppText.login,
                          style: TextStyle(color: Colors.white60, fontSize: width * 0.032, fontWeight: FontWeight.w400),
                          children: [
                            const WidgetSpan(
                              child: SizedBox(width: 3),
                            ),
                            TextSpan(
                              text: AppText.account,
                              style: TextStyle(color: AppColor.white, fontSize: width * 0.042, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showModle() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: Get.height / 1.4,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Form(
                  key: _scaffoldkey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: IconButton(
                          icon: Icon(Icons.linear_scale_outlined, size: Get.width / 10),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(
                              AppImage.otpbk,
                              width: Get.width,
                              height: Get.height * 0.28,
                              fit: BoxFit.fill,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 12, top: 6),
                              height: Get.height * 0.048,
                              width: Get.width * 0.44,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Get.width),
                              ),
                              child: Pinput(
                                controller: otpController,
                                defaultPinTheme: const PinTheme(
                                  textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                length: 6,
                                onSubmitted: (pin) async {
                                  try {
                                    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationCode!, smsCode: pin)).then((value) async {
                                      debugPrint("=======>++++++$_verificationCode");
                                      debugPrint("=======>---------$value");
                                      if (value.user != null) {
                                        debugPrint("==========><===========user${value.user}");
                                        Fluttertoast.showToast(
                                          msg: "This is Number Login success full",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        Get.off(const HomePageScreen());
                                      }
                                    });
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        AppText.sign_up,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Get.width * 0.06),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                        child: Text(
                          AppText.find_and_book,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Get.width * 0.03,
                            color: AppColor.black10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                        child: IntlPhoneField(
                          controller: global.numberController,
                          onCountryChanged: (val) {
                            country = val.dialCode;
                            debugPrint("===>======>phone code ${val.dialCode}");
                          },
                          style: TextStyle(fontSize: Get.width * 0.034, fontWeight: FontWeight.bold),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: AppText.phonenumber,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 1, color: AppColor.black10),
                            ),
                          ),
                          initialCountryCode: AppText.In,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _verifyPhone();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            Color(0xFF7C15FF),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          minimumSize: MaterialStatePropertyAll(
                            Size(Get.width / 2, Get.height * 0.05),
                          ),
                        ),
                        child: const Text(
                          "Send Otp",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _verifyPhone() async {
    debugPrint(
      "+ ${country + global.numberController.text}",
    );
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: country.isEmpty ? "+91${global.numberController.text}" : "+ ${country + global.numberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              debugPrint("========>user");
              Fluttertoast.showToast(
                msg: "This is Number Login success full",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Get.off(const HomePageScreen());
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          debugPrint(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 10));
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
