import 'package:flutter/material.dart';
import 'package:gsm_task/student_module/model/student.dart';

@immutable
abstract class AdminHomeEvent{
  const AdminHomeEvent();
}

@immutable
class AdminHomeFetchEvent extends AdminHomeEvent{}

@immutable
class AdminHomeUpdateEvent extends AdminHomeEvent{
  final Student student;
  const AdminHomeUpdateEvent({required this.student});
}

@immutable
class AdminHomeDenyEvent extends AdminHomeEvent{
  final Student student;
  const AdminHomeDenyEvent({required this.student});
}