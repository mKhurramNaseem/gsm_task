import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_events.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_bloc.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_events.dart';
import 'package:gsm_task/student_module/model/student.dart';

class AdminRegistrationPageRegisterButton extends StatelessWidget {
  static const _registerText = "Register";

  const AdminRegistrationPageRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final bloc = context.read<AdminRegistrationBloc>();
    return InkWell(
      onTap: () {
        bloc.add(RegisterAdminEvent());
        
      },
      child: Container(
          width: width * 0.4,
          height: height * 0.06,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Text(
            _registerText,
            style: GoogleFonts.mulish(
                fontSize: width * 0.07,
                color: Theme.of(context).colorScheme.secondary),
          )),
    );
  }
}

class AdminRegistrationPageCancelButton extends StatelessWidget {
  static const _cancelText = "Cancel";
  const AdminRegistrationPageCancelButton({super.key});

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
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Text(
            _cancelText,
            style: GoogleFonts.mulish(
                fontSize: width * 0.07,
                color: Theme.of(context).colorScheme.secondary),
          )),
    );
  }
}

class AdminPageTextButton extends StatelessWidget {
  static const _alreadyHaveAnAccountLogin = "Already have an account Login ??";
  const AdminPageTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: () {
      },
      child: Text(_alreadyHaveAnAccountLogin,
          style: GoogleFonts.satisfy(
            fontSize: width * 0.045,
          )),
    );
  }
}

////////////////////////////////

class AdminLoginPageRegisterButton extends StatelessWidget {
  static const _registerText = "Register";

  const AdminLoginPageRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      alignment: Alignment.center,
      child: Text(
        _registerText,
        style: TextStyle(fontSize: width * 0.045),
      ),
    );
  }
}

class AdminLoginPageCancelButton extends StatelessWidget {
  static const _cancelText = "Cancel";
  const AdminLoginPageCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      alignment: Alignment.center,
      child: Text(
        _cancelText,
        style: TextStyle(fontSize: width * 0.045),
      ),
    );
  }
}

class AdminHomePageUserName extends StatelessWidget {
  final String name;
  const AdminHomePageUserName({super.key , required this.name,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      name,
      style: GoogleFonts.lobster(
          fontSize: width * 0.06,
          color: Theme.of(context).colorScheme.secondary),
    );
  }
}

class AdminHomePageUserEmail extends StatelessWidget {
  final String email;
  const AdminHomePageUserEmail({super.key , required this.email,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      email,
      style: GoogleFonts.lobster(
          fontSize: width * 0.05,
          color: Theme.of(context).colorScheme.secondary),
    );
  }
}

class AdminHomePageAcceptButton extends StatelessWidget {
  final Student student;
  const AdminHomePageAcceptButton({super.key , required this.student,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bloc = context.read<AdminHomeBloc>();
        student.status = Student.statusApproved;
        bloc.add(AdminHomeUpdateEvent(student: student));
        bloc.add(AdminHomeFetchEvent());
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.cyan.shade500, borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: const Text(
          "Accept",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HomePageDeclineButton extends StatelessWidget {
  final Student student;
  const HomePageDeclineButton({super.key , required this.student});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bloc = context.read<AdminHomeBloc>();
        student.status = Student.statusDeclined;
        bloc.add(AdminHomeDenyEvent(student: student));
        bloc.add(AdminHomeFetchEvent());
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.cyan.shade500, borderRadius: BorderRadius.circular(15)),
        alignment: Alignment.center,
        child: const Text(
          "Decline",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
