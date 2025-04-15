import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Drowning Detection",
          style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            fixedSize: const Size(55, 55),
          ),
          icon: const Icon(
            Iconsax.notification,
            size: 35,
            color: AppColors.blueColor,
          ),
        ),
      ],
    );
  }
}
