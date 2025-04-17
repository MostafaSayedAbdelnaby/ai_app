import 'package:ai_app/features/layouts/register/data/models/user_model.dart';
import 'package:ai_app/features/layouts/register/data/data_sources/data_source.dart';
import 'package:ai_app/features/layouts/register/domain/repositories/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  DataSource dataSource;

  RegisterRepoImpl(this.dataSource);

  @override
  Future<void> register(UserModel userModel) async {
    try {
      dataSource.register(userModel);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addUser(UserModel usrModel) async {
    try {
      await dataSource.addUser(usrModel);
    } catch (e) {
      rethrow;
    }
  }
}
