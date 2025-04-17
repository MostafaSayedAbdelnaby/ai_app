abstract class RegisterStates {}
class RegisterInitial extends RegisterStates {}

// RegisterStates
class RegisterOnLoadingState extends RegisterStates {}

class RegisterOnSuccessState extends RegisterStates {}

class RegisterOnErrorState extends RegisterStates {
  String message;
  RegisterOnErrorState(this.message);
}

