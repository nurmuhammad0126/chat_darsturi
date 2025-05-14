class UserModel {
  final String name;
  final String email;
  final String token;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'token': token,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? token,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, token: $token)';
  }
}
