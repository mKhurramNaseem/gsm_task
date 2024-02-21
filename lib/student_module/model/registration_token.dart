// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistrationToken {
  static const studentTokensCollectionName = 'studentRegistrationTokens';
  static const adminTokensCollectionName = 'adminRegistrationTokens';
  String token;
  RegistrationToken({
    required this.token,
  });

  RegistrationToken copyWith({
    String? token,
  }) {
    return RegistrationToken(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory RegistrationToken.fromMap(Map<String, dynamic> map) {
    return RegistrationToken(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationToken.fromJson(String source) => RegistrationToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegistrationToken(token: $token)';

  @override
  bool operator ==(covariant RegistrationToken other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
