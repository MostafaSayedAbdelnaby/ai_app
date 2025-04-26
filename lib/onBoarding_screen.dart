import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:ai_app/features/layouts/login/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onBoarding1.jpg",
      "title": "Find Your Next Favorite Movie Here",
      "description":
          "Get access to a huge library of movies to suit all tastes.",
    },
    {
      "image": "assets/images/onBoarding2.jpg",
      "title": "Discover Movies",
      "description": "Explore a vast selection of movies in all genres.",
    },
    {
      "image": "assets/images/onBoarding3.jpg",
      "title": "Explore All Genres",
      "description":
          "Discover movies from every genre, thrilling and exciting to watch.",
    },
    {
      "image": "assets/images/onBoarding4.jpg",
      "title": "Create Watchlist",
      "description":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      "image": "assets/images/onBoarding5.jpg",
      "title": "Rate, Review, and Learn",
      "description":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/images/onBoarding6.jpg",
      "title": "Start Watching Now",
      "description": "",
    },
  ];

  void _nextPage() {
    if (_controller.page?.toInt() == onboardingData.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_controller.page?.toInt() != 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                onboardingData[index]["image"]!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              _buildOnboardingContent(
                onboardingData[index]["title"]!,
                onboardingData[index]["description"]!,
                index,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOnboardingContent(String title, String description, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: AppColors.textColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.backgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.backgroundColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                onPressed: _nextPage,
                color: AppColors.blueColor,
                sizedBoxWidth: double.infinity,
                child: Text(
                  index < 5 ? "Next" : "Finish",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: _nextPage,
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.symmetric(vertical: 12),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       backgroundColor: AppColors.blueColor,
              //     ),
              //     child: Text(
              //       index < 5 ? "Next" : "Finish",
              //       style: const TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500,
              //         color: AppColors.textColor,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 12),
              if (index > 1 && index < 5)
                MainButton(
                  onPressed: _previousPage,
                  color: AppColors.backgroundColor,
                  sizedBoxWidth: double.infinity,
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: _previousPage,
              //     style: ElevatedButton.styleFrom(
              //       padding: const EdgeInsets.symmetric(vertical: 12),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       backgroundColor: AppColors.backgroundColor,
              //     ),
              //     child: const Text(
              //       "Back",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500,
              //         color: AppColors.textColor,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
