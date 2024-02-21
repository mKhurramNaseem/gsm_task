import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/views/admin_home_page.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_bloc.dart';
import 'package:gsm_task/admin_module/admin_registration/bloc/admin_registration_states.dart';
import 'package:gsm_task/admin_module/admin_registration/widgets/admin_input_buttons.dart';
import 'package:gsm_task/admin_module/admin_registration/widgets/admin_input_fields.dart';
import 'package:lottie/lottie.dart';

class AdminRegistrationPageDesign extends StatefulWidget {

  static const pageName = 'adminRegistration';
  static const _adminRegistrationPage = "Admin Registration Page";
  const AdminRegistrationPageDesign({super.key});

  @override
  State<AdminRegistrationPageDesign> createState() =>
      _AdminRegistrationPageDesignState();
}

class _AdminRegistrationPageDesignState
    extends State<AdminRegistrationPageDesign> {
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final bloc = context.read<AdminRegistrationBloc>();
    return Builder(
      builder: (context) {
        return BlocListener<AdminRegistrationBloc, AdminRegistrationState>(
          listener: _staesListener,
          bloc: context.read<AdminRegistrationBloc>(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(AdminRegistrationPageDesign._adminRegistrationPage),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: bloc.formKey,
                child: Stack(    
                  alignment: Alignment.center,            
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: height * 0.4,
                            alignment: Alignment.center,
                            child: Lottie.asset(
                              'assets/animations/admin_registration_page_animation.json',
                              fit: BoxFit.contain,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        const AdminRegistrationPageUserNameTextFormField(),
                        const AdminRegistrationPageEmailTextFormField(),
                        const AdminRegistrationPagePasswordTextFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AdminRegistrationPageRegisterButton(),
                            AdminRegistrationPageCancelButton()
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const AdminPageTextButton()
                      ],
                    ),
                    BlocBuilder<AdminRegistrationBloc, AdminRegistrationState>(
                      builder: (context, state) {
                        if (state is AdminRegistrationLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  void _staesListener(BuildContext context, AdminRegistrationState state) {
    if (state is AdminRegistrationSuccessState) {
      Navigator.of(context).pushNamed(AdminHomePageDesign.pageName);
      
    } else if (state is AdminRegistrationErrorState) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message,)));
    }
  }
}
