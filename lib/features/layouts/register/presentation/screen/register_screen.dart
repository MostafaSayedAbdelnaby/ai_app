import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:ai_app/core/routes/app_routes.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:ai_app/core/widgets/main_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    phoneController.clear();

    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();

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
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(
              height: 300,
              // child: Image.asset("assets/images/play_login.png"),
            ),
            MainTextFormField(
              prefixIcon: const ImageIcon(AssetImage("${IconPath.icon}/name.png")),
              hintText: 'name',
              suffixIcon: '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is Required";
                }
                return null;
              },
              controller: nameController,
            ),
            const SizedBox(height: 6),
            MainTextFormField(
              prefixIcon: const ImageIcon(AssetImage("${IconPath.icon}/email.png")),
              hintText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please_enter_your_email';
                }
                final emailRegex =
                RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'please_enter_valid_email';
                }
                return null;
              },
              controller: emailController,
            ),
            const SizedBox(height: 6),
            MainTextFormField(
              prefixIcon: const ImageIcon(AssetImage("${IconPath.icon}/password.png")),
              hintText: 'password',
              suffixIcon: 'password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is Required';
                }
                if (value.length < 6) {
                  return 'Password should be at least 6 Char';
                }
                if (passwordController.text != value) {
                  return 'Password not matched';
                }
                return null;
              },
              controller: passwordController,
            ),
            const SizedBox(height: 6),
            MainTextFormField(
              prefixIcon: const ImageIcon(AssetImage("${IconPath.icon}/phone.png")),
              hintText: 'phoneNumber',
              suffixIcon: '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter_phone_number';
                }
                final phoneRegex =
                RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
                if (!phoneRegex.hasMatch(value)) {
                  return 'please enter a valid phone number';
                }
                return null;
              },
              controller: phoneController,
            ),
            const SizedBox(height: 12),
            MainButton(
              onPressed: () {},
              color: AppColors.blueColor.withOpacity(0.8),
              sizedBoxWidth: 80,
              child: Text(
                "Create Account",
                style: AppTextStyle.getMediumTextStyle(
                  color: AppColors.textColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Have Account ? ',
                  style: AppTextStyle.getMediumTextStyle(
                      color: AppColors.backgroundColor, fontSize: 14),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    'Login',
                    style: AppTextStyle.getMediumTextStyle(
                        color: AppColors.blueColor),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );

  }
}
