import 'package:ai_app/features/layouts/home/presentation/screen/home_screen.dart';
import 'package:ai_app/features/layouts/home/presentation/tabs/click_on.dart';
import 'package:ai_app/features/layouts/login/presentation/screen/login_screen.dart';
import 'package:ai_app/features/layouts/register/presentation/screen/register_screen.dart';
import 'package:ai_app/onBoarding_screen.dart';

class AppRoutes{
  static const String onClick = "onClick";
  static const String onBoarding = "onBoarding";
  static const String login = "login";
  static const String register = "register";
  static const String home = "home";

  static var routes ={
    "onBoarding":(context) => const OnBoardingScreen(),
    "login":(context) => const LoginScreen(),
    "register":(context) => const RegisterScreen(),
    "home":(context) => const HomeScreen(),
    "onClick":(context) => const ClickOn(),
  } ;

}
