
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/views/admin_home_page.dart';
import 'package:gsm_task/main_page/bloc/main_page_bloc.dart';
import 'package:gsm_task/main_page/bloc/main_page_events.dart';
import 'package:lottie/lottie.dart';

import '../widgets/main_input_buttons.dart';

class MainPageDesign extends StatefulWidget {
  static const pageName = 'mainPage';
  static const _appBarTitle = "Main Page Design";

  const MainPageDesign({super.key});

  @override
  State<MainPageDesign> createState() => _MainPageDesignState();
}

class _MainPageDesignState extends State<MainPageDesign> {
  
  @override
  void initState() {    
    super.initState();
    final bloc = context.read<MainPageBloc>();
    bloc.add(SetNotificationChannelEvent(context: context));
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if(event != null){
        Navigator.of(context).pushNamed(AdminHomePageDesign.pageName);
      }
    });
   
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(MainPageDesign._appBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 65,
                child: Lottie.asset(
                  'assets/animations/main_page_animation.json',
                  fit: BoxFit.fill,
                )),
            const Expanded(
                flex: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 6,
                    ),
                    Expanded(flex: 42, child: AdminMainPageButton()),
                    Expanded(flex: 42, child: StudentMainPageButton()),
                    Spacer(
                      flex: 10,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
