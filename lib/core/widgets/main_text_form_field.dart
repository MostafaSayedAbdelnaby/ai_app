import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatefulWidget {
  String? Function(String?) validator;

  Widget prefixIcon;
  String hintText;
  TextEditingController controller;
  final String? suffixIcon;

  MainTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.validator,
    required this.controller,
    this.suffixIcon,
  });

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  String imagePath = ImagesPath.eyeOn;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.hintText.contains("Password") && !isPasswordVisible,
      style: AppTextStyle.getRegularTextStyle(color: AppColors.backgroundColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.blueColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.blueColor,
            )
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.blueColor,
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.redColor,
            )
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: widget.prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
        ),
        prefixIconColor: AppColors.blueColor,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.moColor.withOpacity(0.2),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.getRegularTextStyle(color: AppColors.blueColor),
        suffixIcon: widget.hintText.contains("password")
            ? GestureDetector(
                onTap: () {
                  if (imagePath == ImagesPath.eyeOn) {
                    setState(() {
                      imagePath = ImagesPath.eyeOff;
                    });
                  } else {
                    setState(() {
                      imagePath = ImagesPath.eyeOn;
                    });
                  }
                },
                // onTap: () {
                //   setState(() {
                //     isPasswordVisible = !isPasswordVisible; // true
                //     imagePath = isPasswordVisible
                //         ? AppImagesPaths.eyeOff
                //         : AppImagesPaths.eyeOn; // Change icon
                //   });
                // },
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    AppColors.blueColor,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(imagePath),
                ),
              )
            : null,
      ),
    );
  }
}
