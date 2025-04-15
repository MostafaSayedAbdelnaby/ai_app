import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:flutter/material.dart';

class GalleryCard extends StatelessWidget {
  const GalleryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              '${ImagesPath.path}/children${index + 1 }.jpeg',
                fit: BoxFit.fill,
            ),
          ),
        ),
        itemCount: 8,
      ),
    );
  }
}


