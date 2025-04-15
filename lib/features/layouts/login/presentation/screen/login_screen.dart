import 'package:ai_app/core/app_theme/app_colors.dart';
import 'package:ai_app/core/app_theme/app_text_style.dart';
import 'package:ai_app/core/constants/app_images_paths.dart';
import 'package:ai_app/core/routes/app_routes.dart';
import 'package:ai_app/core/widgets/main_button.dart';
import 'package:ai_app/core/widgets/main_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // emailController.clear();
    // passwordController.clear();

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: AppColors.backgroundColor,
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
              prefixIcon:
                  const ImageIcon(AssetImage("${IconPath.icon}/email.png")),
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
              prefixIcon:
                  const ImageIcon(AssetImage("${IconPath.icon}/password.png")),
              hintText: 'password',
              suffixIcon: 'password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter password';
                }
                if (value.length < 6) {
                  return 'password must be 6 characters';
                }
                return null;
              },
              controller: passwordController,
            ),
            const SizedBox(height: 6),
            Text(
              "Forget Password ?",
              textAlign: TextAlign.end,
              style: AppTextStyle.getMediumTextStyle(
                color: AppColors.blueColor,
              ),
            ),
            const SizedBox(height: 6),
            MainButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              color: AppColors.blueColor.withOpacity(0.8),
              sizedBoxWidth: 80,
              child: Text(
                "login",
                style: AppTextStyle.getMediumTextStyle(
                  color: AppColors.textColor,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t Have Account ? ',
                  style: AppTextStyle.getMediumTextStyle(
                      color: AppColors.backgroundColor, fontSize: 14),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: Text(
                    'Create One',
                    style: AppTextStyle.getMediumTextStyle(
                        color: AppColors.blueColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.backgroundColor,
                    endIndent: 20,
                    indent: 20,
                  ),
                ),
                Text(
                  'OR',
                  style: AppTextStyle.getMediumTextStyle(
                      color: AppColors.blueColor, fontSize: 14),
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.backgroundColor,
                    endIndent: 20,
                    indent: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            MainButton(
              onPressed: () {},
              color: AppColors.blueColor.withOpacity(0.8),
              sizedBoxWidth: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${IconPath.icon}/icon _google.png",
                    color: AppColors.textColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Login With Google',
                    style: AppTextStyle.getMediumTextStyle(
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
