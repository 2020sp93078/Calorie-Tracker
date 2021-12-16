import 'dart:io';
import 'package:calorie_tracker/common/constants.dart';
import 'package:calorie_tracker/screens/calorie_info_screen/calorie_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraButton extends StatefulWidget {
  final Function fetchCalorieData;
  const CameraButton({Key? key, required this.fetchCalorieData})
      : super(key: key);

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker _picker = ImagePicker();
        await _picker.pickImage(source: ImageSource.camera).then((file) async {
          if (file != null) {
            Get.back();
            Get.to(() => CalorieInfoScreen(file: File(file.path)))?.then((_) {
              widget.fetchCalorieData();
            });
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kGreen,
        ),
        padding: EdgeInsets.all(Get.width * 0.06),
        child: SvgPicture.asset(
          "assets/svg/camera.svg",
          width: Get.width * 0.15,
        ),
      ),
    );
  }
}
