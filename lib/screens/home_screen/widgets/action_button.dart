import 'package:calorie_tracker/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  final String svgPath;
  final Function()? onPressed;

  const ActionButton({Key? key, required this.svgPath, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kOrange,
        ),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          svgPath,
          width: 40,
        ),
      ),
    );
  }
}
