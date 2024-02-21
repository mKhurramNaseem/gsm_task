import 'package:flutter/material.dart';

@immutable
abstract class AdminRegistrationState{
  const AdminRegistrationState();
}

@immutable
class AdminRegistrationInitialState extends AdminRegistrationState{}

@immutable
class AdminRegistrationLoadingState extends AdminRegistrationState{}

@immutable
class AdminRegistrationSuccessState extends AdminRegistrationState{}

@immutable
class AdminRegistrationErrorState extends AdminRegistrationState{
  final String message ;
  const AdminRegistrationErrorState({required this.message});
}