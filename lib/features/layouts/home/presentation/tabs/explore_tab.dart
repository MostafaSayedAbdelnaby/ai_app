import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/features/layouts/home/presentation/widgets/gallery_card.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.textColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GalleryCard()
          ],
        ),
      )
    );
  }
}
