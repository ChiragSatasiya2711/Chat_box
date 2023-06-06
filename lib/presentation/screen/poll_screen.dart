import 'package:chat_box/data/controller/globle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';

import '../../utils/App_text.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../../utils/app_list.dart';

class PollScreen extends StatefulWidget {
  const PollScreen({Key? key}) : super(key: key);

  @override
  State<PollScreen> createState() => _PollScreenState();
}

class _PollScreenState extends State<PollScreen> {
  GlobalController global = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF1FAF9),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppText.crpoll,
                  style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(30)),
                  child: CloseButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.04),
              child: Text(
                AppText.whatwould,
                style: TextStyle(fontSize: width * 0.09, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * 0.38,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppList.data6.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    tileColor: AppColor.white,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    activeColor: AppColor.black,
                    contentPadding: const EdgeInsets.all(1),
                    checkColor: AppColor.white,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    subtitle: Text(
                      AppList.data6[index]["idtwo"],
                      style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w500, fontSize: width * 0.035, height: 1.4),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      AppList.data6[index]["id"],
                      style: TextStyle(color: AppColor.black, fontSize: width * 0.035),
                    ),
                    value: global.tabtwo == AppList.data6[index]['id'] ? true : false,
                    onChanged: (value) {
                      setState(() {
                        global.tabtwo = AppList.data6[index]['id'];
                      });
                    },
                  );
                },
              ),
            ),
            Text(
              AppText.voted,
              style: TextStyle(
                fontSize: width * 0.04,
                color: AppColor.black10,
              ),
            ),
            const SizedBox(height: 20),
            ImageStack(
              imageSource: ImageSource.Asset,
              imageList: [
                AppImage.two,
                AppImage.three,
                AppImage.pollone,
                AppImage.homelogo,
                AppImage.four,
                AppImage.cothree,
              ],
              totalCount: 6,
              // If larger than images.length, will show extra empty circle
              imageCount: 6,
              imageRadius: 60,
            ),
          ],
        ),
      ),
    );
  }
}
