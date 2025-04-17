import 'package:ai_app/features/layouts/register/data/models/user_model.dart';

abstract class DataSource {
  Future<void> addUser(UserModel user);

  // Future<UserModel> getUser(String userId);
  /// register User
  Future<void> register(UserModel userModel);
}
