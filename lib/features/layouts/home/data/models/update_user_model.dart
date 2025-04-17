class UpdateUserModel {
  String name;
  String phoneNumber;
  int? indexOfImage;

  UpdateUserModel({
    required this.name,
    required this.phoneNumber,
    this.indexOfImage,
  });

  UpdateUserModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          phoneNumber: json['phoneNumber'],
          indexOfImage: json['indexOfImage'] as int,
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'indexOfImage': indexOfImage,
    };
  }
}
