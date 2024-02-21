import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_bloc.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_bloc.dart';
import 'package:gsm_task/firebase_options.dart';
import 'package:gsm_task/main_page/bloc/main_page_bloc.dart';
import 'package:gsm_task/main_page/view/main_page_design.dart';
import 'package:gsm_task/navigation/on_route_generate.dart';
import 'package:gsm_task/student_module/student_registration/bloc/student_registration_bloc.dart';
import 'package:gsm_task/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {  
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdminHomeBloc>(
          create: (context) => AdminHomeBloc(),
        ),
        BlocProvider<AdminRegistrationBloc>(
          create: (context) => AdminRegistrationBloc(),
        ),
        BlocProvider<StudentRegistrationBloc>(
          create: (context) => StudentRegistrationBloc(),
        ),
        BlocProvider<MainPageBloc>(create: (context) => MainPageBloc(),)
      ],
      child: MaterialApp(
        title: 'Flutter App',
        onGenerateRoute: RouteGeneration.onGenerateRoute,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: MyColorScheme.primaryColor,
              primary: MyColorScheme.primaryColor,
              secondary: MyColorScheme.secondaryColors,
              tertiary: MyColorScheme.tertiaryColor,
              onPrimary: MyColorScheme.registrationPageThemeColor),
          useMaterial3: true,
        ),
        initialRoute: MainPageDesign.pageName,
      ),
    );
  }
}
