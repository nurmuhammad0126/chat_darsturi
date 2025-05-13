class AuthModel {
  final String idToken;
  final String email;
  final String refreshToken;
  final String expiresIn;
  final String localId;

  const AuthModel({
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      idToken: json['idToken'] as String,
      email: json['email'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as String,
      localId: json['localId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'email': email,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
      'localId': localId,
    };
  }

  AuthModel copyWith({
    String? idToken,
    String? email,
    String? refreshToken,
    String? expiresIn,
    String? localId,
  }) {
    return AuthModel(
      idToken: idToken ?? this.idToken,
      email: email ?? this.email,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      localId: localId ?? this.localId,
    );
  }

  @override
  String toString() {
    return 'AuthModel(idToken: $idToken, email: $email, refreshToken: $refreshToken, expiresIn: $expiresIn, localId: $localId)';
  }
}
