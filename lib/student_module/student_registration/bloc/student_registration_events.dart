import 'package:flutter/material.dart';

@immutable
abstract class StudentRegistrationEvent{}

@immutable
class RegisterStudentEvent extends StudentRegistrationEvent{}