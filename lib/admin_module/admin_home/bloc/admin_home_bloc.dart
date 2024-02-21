import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_events.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_states.dart';
import 'package:gsm_task/services/database_service.dart';
import 'package:gsm_task/services/notification_service.dart';
import 'package:gsm_task/student_module/model/registration_token.dart';
import 'package:gsm_task/student_module/model/student.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent,AdminHomeState>{
  static const _errorMessage = 'Something went wrong';
  final StudentDatabaseService _databaseService = StudentDatabaseService();
  final NotificationService _notificationService = NotificationService();
  AdminHomeBloc():super(AdminHomeInitialState()){
    on<AdminHomeFetchEvent>(_mapEventToState);
    on<AdminHomeUpdateEvent>(_updateStudent);
    on<AdminHomeDenyEvent>(_denyStudent);
  }

  FutureOr<void> _mapEventToState(AdminHomeFetchEvent event, Emitter<AdminHomeState> emit) async{
    try{
      emit(AdminHomeLoadingState());
    List<Student> studentList = await _databaseService.fetchStudents(Student.statusPending); 
    emit(AdminHomeLoadedState(studentList: studentList));
    }catch (e){
      emit(const AdminHomeErrorState(message: _errorMessage));
    }
  }



  FutureOr<void> _updateStudent(AdminHomeUpdateEvent event, Emitter<AdminHomeState> emit) async{
    _databaseService.insertStudent(event.student);
    RegistrationToken current = await _databaseService.fetchStudentsRegistrationTokens(student: event.student);
    _notificationService.sendNotification(title: 'Request Accepted', body: 'Your Request has been accepted', token: current.token,message: 'toUser');
  }

  FutureOr<void> _denyStudent(AdminHomeDenyEvent event, Emitter<AdminHomeState> emit) async{
    _databaseService.insertStudent(event.student);
    RegistrationToken current = await _databaseService.fetchStudentsRegistrationTokens(student: event.student);
    _notificationService.sendNotification(title: 'Request Declined', body: 'Your Request has been denied', token: current.token,message: 'toUser');
  }
}