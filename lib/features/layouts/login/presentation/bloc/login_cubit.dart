import 'package:ai_app/features/layouts/login/domain/repositories/login_repo.dart';
import 'package:bloc/bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  // Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginOnLoadingState());
    try {
      await loginRepo.login(email: email, password: password);
      emit(LoginOnSuccessState());
    } catch (e) {
      emit(LoginOnErrorState(e.toString()));
    }
  }
}
