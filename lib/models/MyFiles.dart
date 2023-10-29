import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khkt2223/screens/info_components/color.dart';

import '../controllers/question_controller.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage, id;
  final Color? color;
  //final QuestionController qnController = Get.put(QuestionController());

  CloudStorageInfo({
    //this.qnController,
    this.id,
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}



List demoMyFiles = [
  CloudStorageInfo(
    id: 1,
    title: "Ghi nhớ",
    numOfFiles: 3,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "5 câu",
    color: kPrimaryColor,
    percentage: 60,
  ),
  CloudStorageInfo(
    id: 2,
    title: "Toán",
    numOfFiles: 3,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "3 câu",
    color: Color(0xFFFFA113),
    percentage: 100,
  ),
  CloudStorageInfo(
    id: 3,
    title: "Đọc",
    numOfFiles: 2,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "5 câu",
    color: Color(0xFFA4CDFF),
    percentage: 40,
  ),
  CloudStorageInfo(
    id: 4,
    title: "Khác",
    numOfFiles: 7,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "10 câu",
    color: Color(0xFF007EE5),
    percentage: 70,
  ),
];
