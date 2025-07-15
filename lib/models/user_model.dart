class UserModel {
  final String id;
  final String email;

  UserModel({required this.id, required this.email});

  factory UserModel.fromMap(String id, Map<String, dynamic> map) {
    return UserModel(id: id, email: map['email']);
  }
}
