import 'package:firebase_auth/firebase_auth.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  /// Login
  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }
}