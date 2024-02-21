import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/services/database_service.dart';
import 'package:gsm_task/services/notification_service.dart';
import 'package:gsm_task/student_module/model/registration_token.dart';
import 'package:gsm_task/student_module/model/student.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_events.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_states.dart';

class StudentRegistrationBloc
    extends Bloc<StudentRegistrationEvent, StudentRegistrationState> {
  // Static constants
  static const _title = 'Student Request',
      _message = 'A new student has requested access';
  // Controllers
  late TextEditingController nameController,
      emailController,
      phoneNoController,
      passwordController;
  // Key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Database Service isntance
  final StudentDatabaseService _dbService = StudentDatabaseService();
  final NotificationService _notificationService = NotificationService();

  StudentRegistrationBloc() : super(StudentRegistrationInitialState()) {
    // Initializing Controllers
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneNoController = TextEditingController();
    passwordController = TextEditingController();
    // Mapping events to states
    on<RegisterStudentEvent>(_mapEventToStates);
  }

  // Function triggered by event
  FutureOr<void> _mapEventToStates(RegisterStudentEvent event,
      Emitter<StudentRegistrationState> emit) async {
    if (formKey.currentState!.validate()) {
      emit(StudentRegistrationLoadingState());
      try {
        Student student = Student(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            phoneNo: phoneNoController.text,
            status: Student.statusPending);
            // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        await _dbService.insertStudent(student);
        await notifiyAdmin();
        await uploadTokenToServer();
        _clearControllers();
        emit(StudentRegistrationSuccessState(student: student));
      } catch (e) {
        emit(StudentRegistrationErrorState(message: e.toString()));
      }
    }
  }

  // Function to send notification to admin
  notifiyAdmin() async {
    List<RegistrationToken> tokens =
        await _dbService.fetchAdminsRegistrationTokens();
    for (var current in tokens) {
      _notificationService.sendNotification(
          title: _title, body: _message, token: current.token,message: 'toAdmin');
    }
  }

  uploadTokenToServer() async {
    String? token = await FirebaseMessaging.instance.getToken();
    await _dbService.uploadStudentTokenToServer(
      RegistrationToken(token: token!),
      emailController.text.substring(
        0,
        emailController.text.indexOf('@gmail.com'),
      ),
    );
  }

  _clearControllers() {
    nameController.clear();
    emailController.clear();
    phoneNoController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    // Preventing Memory Leak
    nameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
