import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:ai_app/core/routes/app_routes.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:ai_app/core/widgets/main_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.textColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/images/image_avatar_1.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                ),
              ),
              MainTextFormField(
                prefixIcon:
                    const ImageIcon(AssetImage("${IconPath.icon}/profile.png")),
                hintText: 'name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is Required";
                  }
                  return null;
                },
                controller: nameController..text
                // = widget.updateUserModel.name,
              ),
              const SizedBox(height: 6),
              MainTextFormField(
                prefixIcon: const ImageIcon(
                    AssetImage("${IconPath.icon}/phone.png")),
                hintText: 'phone',
                suffixIcon: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_phone_number';
                  }
                  final phoneRegex = RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return 'please enter a valid phone number';
                  }
                  return null;
                },
                controller: phoneController
                  ..text
                  // = widget.updateUserModel.phoneNumber,
              ),
              const Spacer(),
              MainButton(
                onPressed: () {},
                color: AppColors.blueColor.withOpacity(0.8),
                sizedBoxWidth: 20,
                child: Text(
                  'Delete Account',
                  style: AppTextStyle.getMediumTextStyle(
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              MainButton(
                onPressed: () {},
                color: AppColors.blueColor.withOpacity(0.8),
                sizedBoxWidth: 20,
                child: Text(
                  'Update Data',
                  style: AppTextStyle.getMediumTextStyle(
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
