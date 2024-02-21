import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_bloc.dart';
import 'package:gsm_task/utils/text_field_validations.dart';

class StudentPageNameTextFormField extends StatelessWidget {
  static const _studentName = "Name";
  const StudentPageNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: bloc.nameController,
        validator: TextFieldValidations.validateName,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _studentName,
        ),
      ),
    );
  }
}

class StudentPagePhoneNumberTextFormField extends StatelessWidget {
  static const _studentPhoneNumber = "Phone Number";
  const StudentPagePhoneNumberTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: bloc.phoneNoController,
        validator: TextFieldValidations.validatePhoneNumber,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _studentPhoneNumber,
        ),
      ),
    );
  }
}

class StudentPageEmailTextFormField extends StatelessWidget {
  static const _studentEmail = "Email";
  const StudentPageEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: TextFieldValidations.validateEmailAddress,
        controller: bloc.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _studentEmail,
        ),
      ),
    );
  }
}

class StudentPagePasswordTextFormField extends StatelessWidget {
  static const _studentPassword = "Password";
  const StudentPagePasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        validator: TextFieldValidations.validatePassword,
        controller: bloc.passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _studentPassword,
        ),
      ),
    );
  }
}
