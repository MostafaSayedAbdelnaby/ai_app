import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  Widget child;
  VoidCallback onPressed;
  Color color;
  double sizedBoxWidth;

  MainButton(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color,
      required this.sizedBoxWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.0,
      width: sizedBoxWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: color == const Color(0XFF121312)
                ? const BorderSide(color: AppColors.backgroundColor, width: 2)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
