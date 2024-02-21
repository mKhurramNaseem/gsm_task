import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_bloc.dart';
import 'package:gsm_task/utils/text_field_validations.dart';

class AdminRegistrationPageUserNameTextFormField extends StatelessWidget {
  static const _userName = "Name";
  const AdminRegistrationPageUserNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AdminRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        validator: TextFieldValidations.validateName,
        controller: bloc.nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _userName,
        ),
      ),
    );
  }
}

class AdminRegistrationPageEmailTextFormField extends StatelessWidget {
  static const _adminEmail = "Email";

  const AdminRegistrationPageEmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AdminRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        validator: TextFieldValidations.validateEmailAddress,
        controller: bloc.emailController,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _adminEmail,
        ),
      ),
    );
  }
}

class AdminRegistrationPagePasswordTextFormField extends StatelessWidget {
  static const _userPassword = "Password";
  const AdminRegistrationPagePasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AdminRegistrationBloc>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: TextFormField(
        validator: TextFieldValidations.validatePassword,
        controller: bloc.passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: _userPassword,
        ),
      ),
    );
  }
}
