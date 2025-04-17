import 'package:ai_app/features/layouts/login/data/data_sources/login_data_source.dart';
import 'package:ai_app/features/layouts/login/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo{
  LoginDataSource loginDataSource ;
  LoginRepoImpl(this.loginDataSource);

  @override
  Future<void> login({required String email, required String password})async {
    try {
      await loginDataSource.login(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}