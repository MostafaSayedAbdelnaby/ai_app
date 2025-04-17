class UserModel {
  String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  int? indexOfImage;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.id ="",
    required this.phoneNumber,
    this.indexOfImage,
  });

  UserModel.fromJson(Map<String , dynamic> json):this (
    id: json['id'],
    name: json['name'],
    password: json['password'],
    email: json['email'],
    phoneNumber: json['phoneNumber'],
    indexOfImage: json['indexOfImage'] as int,
  );

  Map<String , dynamic>toJson (){
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'indexOfImage': indexOfImage,
    };
  }
}