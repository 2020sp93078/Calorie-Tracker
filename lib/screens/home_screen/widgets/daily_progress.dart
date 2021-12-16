import 'package:calorie_tracker/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DailyProgress extends StatelessWidget {
  final int caloriesConsumed;
  final int totalCalories;
  const DailyProgress(
      {Key? key, required this.caloriesConsumed, required this.totalCalories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 300,
      lineWidth: 8.0,
      percent: (caloriesConsumed / totalCalories).clamp(0, 1),
      progressColor: ((caloriesConsumed / totalCalories) > 1)
          ? const Color(0xFFFDC402)
          : const Color(0xFFA2C101),
      backgroundColor: kLightBlack,
      center: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.05),
        child: Column(
          children: [
            Text(
              '$caloriesConsumed \n/ $totalCalories',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const Text(
              'cal left',
              style: TextStyle(
                fontSize: 14,
                color: kOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
