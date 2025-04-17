import 'package:ai_app/features/layouts/home/data/models/update_user_model.dart';
import 'package:ai_app/features/layouts/home/domain/repositories/update_repo.dart';
import 'package:ai_app/features/layouts/home/presentation/bloc/user_data_states.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataCubit extends Cubit<UserDataStates> {
  UpdateRepo updateRepo;
  UpdateUserModel? updateUserModel;
  User? currentUser;

  UserDataCubit({required this.updateRepo}) : super(UserDataInitial());

  // /// set Avatar Image
  // setAvatarImage(int currentIndex) {
  //   /// Dr osama
  //   // currentIndex = updateUserModel?.indexOfImage ?? 0;
  //   emit(AvatarImageState(currentIndex));
  // }

  /// update User
  Future<void> updateUser(UpdateUserModel updateUserModel) async {
    emit(UpdateOnLoadingStates());
    try {
      await updateRepo.updateUser(updateUserModel);
      emit(UpdateOnSuccessStates());
    } catch (e) {
      emit(UpdateOnErrorStates(e.toString()));
    }
  }

  /// delete User
  Future<void> deleteUser() async {
    emit(DeleteOnLoadingStates());
    try {
      await updateRepo.deleteUser();
      emit(DeleteOnSuccessStates());
    } catch (e) {
      emit(DeleteOnErrorStates(e.toString()));
    }
  }

  /// logOut User
  Future<void> logOutUser() async {
    emit(LogOutOnLoadingStates());
    try {
      await updateRepo.logOutUser();
      emit(LogOutOnSuccessStates());
    } catch (e) {
      emit(LogOutOnErrorStates(e.toString()));
    }
  }

  /// get User
  Future<void> getUser() async {
    emit(GetDataOnLoadingStates());
    try {
      updateUserModel = await updateRepo.getUser();
      emit(GetDataOnSuccessStates(
        updateUserModel: updateUserModel,
      ));
    }
    // catch (e) {
    //   emit(GetDataOnErrorStates(e.toString()));
    // }
    catch (error) {
      emit(GetDataOnErrorStates(error.toString()));
      print("Error fetching user data: $error");
    }
  }
}
