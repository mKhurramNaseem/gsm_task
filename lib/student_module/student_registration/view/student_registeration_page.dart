
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_bloc.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_states.dart';
import 'package:gsm_task/student_module/student_registration/widgets/student_fields.dart';
import 'package:gsm_task/student_module/student_registration/widgets/student_input_buttons.dart';
import 'package:gsm_task/student_module/student_status/student_status_page.dart';
import 'package:lottie/lottie.dart';

class StudentRegistrationPageDesign extends StatelessWidget {
  static const pageName = 'studentRegistration';
  static const _studentRegistrationAppMainPage = "Student Registration Page";

  const StudentRegistrationPageDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentRegistrationBloc>();
    return BlocListener<StudentRegistrationBloc,StudentRegistrationState>(
      listener: _statesListener,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_studentRegistrationAppMainPage),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: bloc.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 400,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      'assets/animations/student_registration_page_animation.json',
                      // width: 200,
                      // height: 200,
                      fit: BoxFit.fill,
                    )),
                const StudentPageNameTextFormField(),
                const StudentPagePhoneNumberTextFormField(),
                const StudentPageEmailTextFormField(),
                const StudentPagePasswordTextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StudentPageRegisterButton(),
                    StudentPageCancelButton()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _statesListener(BuildContext context, StudentRegistrationState state) {
    if(state is StudentRegistrationSuccessState){
      Navigator.of(context).pushNamed(StudentStatusPage.pageName , arguments: state.student);
    }else if(state is StudentRegistrationErrorState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }
}
