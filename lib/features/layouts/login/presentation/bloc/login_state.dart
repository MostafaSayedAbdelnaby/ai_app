abstract class LoginStates {}
class LoginInitial extends LoginStates {}

// LoginStates
class LoginOnLoadingState extends LoginStates {}

class LoginOnSuccessState extends LoginStates {}

class LoginOnErrorState extends LoginStates {
  String message;
  LoginOnErrorState(this.message);
}