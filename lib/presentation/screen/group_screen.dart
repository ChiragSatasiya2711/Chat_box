import 'package:chat_box/utils/App_text.dart';
import 'package:chat_box/utils/app_color.dart';
import 'package:chat_box/utils/app_image.dart';
import 'package:chat_box/utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackButton(
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(width: width * 0.2),
                Text(
                  AppText.crgroup,
                  style: TextStyle(fontSize: width * 0.044, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              AppText.description,
              style: TextStyle(
                fontSize: width * 0.04,
                height: 2,
                color: AppColor.black10,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              child: Text(
                AppText.makegroup,
                style: TextStyle(fontSize: width * 0.09, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    color: AppColor.black10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      AppText.gwork,
                      style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  height: height * 0.05,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    color: AppColor.black10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      AppText.teamrelation,
                      style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            Text(
              AppText.groupadmin,
              style: TextStyle(
                fontSize: width * 0.038,
                height: 3,
                color: AppColor.black10,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(1),
              leading: Image.asset(AppImage.groupone),
              title: Text(
                AppText.rkhan,
                style: TextStyle(fontSize: width * 0.048, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                AppText.groupadmin,
                style: TextStyle(fontSize: width * 0.036, color: AppColor.black10),
              ),
            ),
            Text(
              AppText.invited,
              style: TextStyle(fontSize: width * 0.038, height: 3, color: AppColor.black10),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppList.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) => Image.asset(AppList.data[index]),
              ),
            ),
            Center(
              child: Container(
                height: height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.perple,
                ),
                child: Center(
                    child: Text(
                  AppText.create,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: width * 0.048,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
