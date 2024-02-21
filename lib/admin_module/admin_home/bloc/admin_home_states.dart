import 'package:flutter/material.dart';
import 'package:gsm_task/student_module/model/student.dart';

@immutable
abstract class AdminHomeState{
  const AdminHomeState();
}

@immutable
class AdminHomeInitialState extends AdminHomeState{}

@immutable
class AdminHomeLoadingState extends AdminHomeState{}

@immutable
class AdminHomeLoadedState extends AdminHomeState{
  final List<Student> studentList;
  const AdminHomeLoadedState({required this.studentList});
}

@immutable
class AdminHomeErrorState extends AdminHomeState{
  final String message;
  const AdminHomeErrorState({required this.message});
}