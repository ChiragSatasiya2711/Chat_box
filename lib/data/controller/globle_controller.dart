import 'package:chat_box/presentation/screen/message_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class GlobalController extends GetxController {
  User? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController psdController = TextEditingController();
  TextEditingController cpsdController = TextEditingController();
  final TextEditingController textEditingController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  RxInt tab = 0.obs;
  List tabone = ["1", "2", "3", "4", "5", "6"];
  List<Map<String, dynamic>> newMsg = [];

  RxBool change = false.obs;
  RxString? tabtwo = "".obs;

  RxString msgType = "".obs;

  List<MsgData> msgList = [];
  List massage = [];

  TextEditingController searchController = TextEditingController();
  List fooList = [];
  List filteredList = [];
  List<Map<String, dynamic>> history = [];

  final ImagePicker picker = ImagePicker();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> pickImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }

  Future<void> pickgallary() async {
    final XFile? gallary = await picker.pickImage(source: ImageSource.gallery);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  }
}
