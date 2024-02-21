
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsm_task/admin_module/admin_registration/views/admin_registration_page_design.dart';
import 'package:gsm_task/student_module/student_registration/view/student_registeration_page.dart';

class StudentMainPageButton extends StatelessWidget {
  static const _studentText = "Student";
  const StudentMainPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(StudentRegistrationPageDesign.pageName);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 45, right: 45, top: 30, bottom: 25),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Text(
            _studentText,
            style: GoogleFonts.lobster(
                fontSize: width * 0.07,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}

class AdminMainPageButton extends StatelessWidget {
  static const _adminText = "Admin";

  const AdminMainPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () async{
          Navigator.of(context).pushNamed(AdminRegistrationPageDesign.pageName);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 45, right: 45, top: 30, bottom: 25),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Text(
            _adminText,
            style: GoogleFonts.lobster(
                fontSize: width * 0.07,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
