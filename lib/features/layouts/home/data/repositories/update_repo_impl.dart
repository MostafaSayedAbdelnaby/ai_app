import 'package:ai_app/features/layouts/home/data/data_sources/update_data_source.dart';
import 'package:ai_app/features/layouts/home/data/models/update_user_model.dart';
import 'package:ai_app/features/layouts/home/domain/repositories/update_repo.dart';

class UpdateRepoImpl implements UpdateRepo {
  UpdateDataSource updateDataSource;

  UpdateRepoImpl(this.updateDataSource);

  @override
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    try {
      await updateDataSource.updateUser(updateUserModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await updateDataSource.deleteUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOutUser() async {
    try {
      await updateDataSource.logOutUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  getUser() async {
    try {
      return await updateDataSource.getUser();
    } catch (e) {
      rethrow;
    }
  }
}
