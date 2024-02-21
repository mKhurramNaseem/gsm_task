import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_events.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_states.dart';
import 'package:gsm_task/services/database_service.dart';
import 'package:gsm_task/student_module/model/registration_token.dart';

class AdminRegistrationBloc extends Bloc<AdminRegistrationEvent , AdminRegistrationState>{
  late TextEditingController nameController , emailController , passwordController;
  final StudentDatabaseService _databaseService = StudentDatabaseService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AdminRegistrationBloc():super(AdminRegistrationInitialState()){
    // Initializing controllers
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    on<RegisterAdminEvent>(_mapEventToState);
  }

  FutureOr<void> _mapEventToState(RegisterAdminEvent event, Emitter<AdminRegistrationState> emit) async{
 if(formKey.currentState!.validate()){
     try{
      emit(AdminRegistrationLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    await uploadAdminTokenToServer();
    _clearControllers();
    emit(AdminRegistrationSuccessState());
    }catch (e){
      emit(AdminRegistrationErrorState(message:e.toString()));
    }
 }

  }

  uploadAdminTokenToServer() async{
    String? token = await FirebaseMessaging.instance.getToken();
     _databaseService.uploadAdminTokenToServer(RegistrationToken(token: token!), emailController.text.substring(0 , emailController.text.indexOf('@gmail.com'),),);
  }

  _clearControllers(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}