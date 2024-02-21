// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  // Static constants of the app
  static const statusApproved = 'approved' , statusPending = 'pending' , statusDeclined = 'declined';
  static const keyName = 'name' , keyEmail = 'email' , keyPassword = 'password' , keyPhoneNo = 'phoneNo' , keyStatus = 'status';
  static const collectionName = 'students';
  // Instance members
  String name;
  String email;
  String password;
  String phoneNo;
  String status;

  Student({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.status,
  });

  Student copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNo,
    String? status,
  }) {
    return Student(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNo: phoneNo ?? this.phoneNo,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Student.keyName : name,
      Student.keyEmail: email,
      Student.keyPassword: password,
      Student.keyPhoneNo: phoneNo,
      Student.keyStatus: status,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map[Student.keyName] as String,
      email: map[Student.keyEmail] as String,
      password: map[Student.keyPassword] as String,
      phoneNo: map[Student.keyPhoneNo] as String,
      status: map[Student.keyStatus] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(name: $name, email: $email, password: $password, phoneNo: $phoneNo, status: $status)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.phoneNo == phoneNo &&
      other.status == status;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      phoneNo.hashCode ^
      status.hashCode;
  }
}
