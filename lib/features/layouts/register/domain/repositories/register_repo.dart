import 'package:ai_app/features/layouts/register/data/models/user_model.dart';

abstract class RegisterRepo {
  Future<void> register(UserModel userModel);

  Future<void> addUser(UserModel usrModel);
}
