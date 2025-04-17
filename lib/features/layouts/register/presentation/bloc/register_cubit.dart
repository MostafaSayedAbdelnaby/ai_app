import 'package:ai_app/features/layouts/register/data/models/user_model.dart';
import 'package:ai_app/features/layouts/register/domain/repositories/register_repo.dart';
import 'package:ai_app/features/layouts/register/presentation/bloc/register_state.dart';
import 'package:bloc/bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterRepo registerRepo;

  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  // Register
  Future<void> register(UserModel userModel) async {
    emit(RegisterOnLoadingState());

    try {
      await registerRepo.register(userModel);
      emit(RegisterOnSuccessState());
    } catch (e) {
      emit(RegisterOnErrorState(e.toString()));
    }
  }

  // Add User
  addUser(UserModel userModel) async {
    emit(RegisterOnLoadingState());
    try {
      await registerRepo.addUser(userModel);
      emit(RegisterOnSuccessState());
    } catch (e) {
      emit(RegisterOnErrorState(e.toString()));
    }
  }
}
