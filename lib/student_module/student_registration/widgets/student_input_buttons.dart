import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_bloc.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_events.dart';

class StudentPageRegisterButton extends StatelessWidget {
  static const _registerText = "Register";

  const StudentPageRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final bloc = context.read<StudentRegistrationBloc>();
    return InkWell(
      onTap: () {
        bloc.add(RegisterStudentEvent());        
      },
      child: Container(
        width: width * 0.4,
        height: height * 0.06,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(250),
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          _registerText,
          style: TextStyle(fontSize: width * 0.045),
        ),
      ),
    );
  }
}

class StudentPageCancelButton extends StatelessWidget {
  static const _cancelText = "Cancel";
  const StudentPageCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: width * 0.4,
        height: height * 0.06,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(250),
            borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: Text(
          _cancelText,
          style: TextStyle(fontSize: width * 0.045),
        ),
      ),
    );
  }
}
