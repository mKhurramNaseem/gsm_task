import 'package:flutter/cupertino.dart';
import 'package:gsm_task/admin_module/admin_home/views/admin_home_page.dart';
import 'package:gsm_task/admin_module/admin_registration/views/admin_registration_page_design.dart';
import 'package:gsm_task/main_page/view/main_page_design.dart';
import 'package:gsm_task/student_module/student_registration/view/student_registeration_page.dart';
import 'package:gsm_task/student_module/student_status/student_status_page.dart';
import 'package:gsm_task/utils/error_page.dart';

class RouteGeneration {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      MainPageDesign.pageName => CupertinoPageRoute(
          builder: (context) => const MainPageDesign(),
        ),
      AdminRegistrationPageDesign.pageName => CupertinoPageRoute(
          builder: (context) => const AdminRegistrationPageDesign(),
        ),
      AdminHomePageDesign.pageName => CupertinoPageRoute(
          builder: (context) => const AdminHomePageDesign(),
        ),
      StudentRegistrationPageDesign.pageName => CupertinoPageRoute(
          builder: (context) => const StudentRegistrationPageDesign(),
        ),
      StudentStatusPage.pageName => CupertinoPageRoute(
          builder: (context) => const StudentStatusPage(),settings: settings,
        ),
      _ => CupertinoPageRoute(
          builder: (context) => const ErrorPage(),
        ),
    };
  }
}
