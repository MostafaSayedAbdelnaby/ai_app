import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/features/layouts/home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textColor,
        body: Column(
          children: [
            HomeSlider(
              onChange: (value) {
                setState(() {
                  currentSlide = value;
                });
              },
              currentSlide: currentSlide,
            ),
            const SizedBox(height: 20),

          ],
        ),
    );
  }
}
