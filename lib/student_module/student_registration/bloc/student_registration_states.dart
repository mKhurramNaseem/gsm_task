import 'package:flutter/material.dart';
import 'package:gsm_task/student_module/model/student.dart';

@immutable
abstract class StudentRegistrationState{
  const StudentRegistrationState();
}

@immutable
class StudentRegistrationInitialState extends StudentRegistrationState{}

@immutable
class StudentRegistrationLoadingState extends StudentRegistrationState{}

@immutable
class StudentRegistrationSuccessState extends StudentRegistrationState{
  final Student student;
  const StudentRegistrationSuccessState({required this.student});
}

@immutable
class StudentRegistrationErrorState extends StudentRegistrationState{
  final String message;
  const StudentRegistrationErrorState({required this.message});
}