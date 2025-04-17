import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:ai_app/features/layouts/home/presentation/tabs/explore_tab.dart';
import 'package:ai_app/features/layouts/home/presentation/tabs/home_tab.dart';
import 'package:ai_app/features/layouts/home/presentation/tabs/profile_tab.dart';
import 'package:ai_app/features/layouts/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    currentIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        title: const HomeAppBar(),
      ),
      body: Stack(
        children: [
          tabs[currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.blueColor,
        selectedItemColor: AppColors.redColor,
        unselectedItemColor: AppColors.textColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildNavItem("home", isSelected: currentIndex == 0),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem("explore", isSelected: currentIndex == 1),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem("profile", isSelected: currentIndex == 2),
            label: "",
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    ExploreTab(),
    // ProfileTab(),
    ProfileTabWidget()
  ];

  Widget _buildNavItem(String imageName, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? AppColors.yellowColor.withOpacity(0.2)
            : Colors.transparent,
      ),
      padding: const EdgeInsets.all(8.0), // Padding around the icon
      child: ImageIcon(
        AssetImage("${IconPath.icon}/$imageName.png"),
        color: isSelected ? AppColors.yellowColor : AppColors.textColor,
      ),
    );
  }
}
