import 'package:ai_app/features/layouts/home/data/models/update_user_model.dart';

abstract class UpdateDataSource {
  Future<void> updateUser(UpdateUserModel updateUserModel);

  Future<void> deleteUser();

  Future<void> logOutUser();

  getUser();
}
