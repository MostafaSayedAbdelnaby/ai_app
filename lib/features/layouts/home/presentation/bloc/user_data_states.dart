import 'package:ai_app/features/layouts/home/data/models/update_user_model.dart';

abstract class UserDataStates {}

class UserDataInitial extends UserDataStates {}

///      ****************         UserDataStates             *****************
class UserDataLoadingStates extends UserDataStates {}

class UserDataSuccessStates extends UserDataStates {
  final UpdateUserModel? updateUserModel;

  UserDataSuccessStates({required this.updateUserModel});
}

class UserDataErrorStates extends UserDataStates {
  String message;

  UserDataErrorStates(this.message);
}

///      ****************         GetDataStates             *****************
class GetDataOnLoadingStates extends UserDataStates {}

class GetDataOnErrorStates extends UserDataStates {
  String message;

  GetDataOnErrorStates(this.message);
}

class GetDataOnSuccessStates extends UserDataStates {
  final UpdateUserModel? updateUserModel;

  GetDataOnSuccessStates({required this.updateUserModel});
}

///      ****************         UpdateStates             *****************
class UpdateOnLoadingStates extends UserDataStates {}

class UpdateOnErrorStates extends UserDataStates {
  String message;

  UpdateOnErrorStates(this.message);
}

class UpdateOnSuccessStates extends UserDataStates {}

///      ****************         deleteStates             *****************
class DeleteOnLoadingStates extends UserDataStates {}

class DeleteOnErrorStates extends UserDataStates {
  String message;

  DeleteOnErrorStates(this.message);
}

class DeleteOnSuccessStates extends UserDataStates {}

///      ****************         LogOut             *****************
class LogOutOnLoadingStates extends UserDataStates {}

class LogOutOnErrorStates extends UserDataStates {
  String message;

  LogOutOnErrorStates(this.message);
}

class LogOutOnSuccessStates extends UserDataStates {}

// ///      ****************         AvatarImageSetState             *****************
// class AvatarImageState extends UserDataStates {
//   int currentIndex;
//
//   AvatarImageState(this.currentIndex);
// }
