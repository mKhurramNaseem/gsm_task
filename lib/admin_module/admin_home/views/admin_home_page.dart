import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_bloc.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_events.dart';
import 'package:gsm_task/admin_module/admin_home/bloc/admin_home_states.dart';
import 'package:gsm_task/admin_module/admin_registration/widgets/admin_input_buttons.dart';

class AdminHomePageDesign extends StatefulWidget {
  static const pageName = 'adminhome';
  static const _adminHomePage = "Admin Home Page";
  const AdminHomePageDesign({super.key});

  @override
  State<AdminHomePageDesign> createState() => _AdminHomePageDesignState();
}

class _AdminHomePageDesignState extends State<AdminHomePageDesign> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<AdminHomeBloc>();
    bloc.add(AdminHomeFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(AdminHomePageDesign._adminHomePage),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  final bloc = context.read<AdminHomeBloc>();
                  bloc.add(AdminHomeFetchEvent());
                },
                icon: const Icon(Icons.refresh_rounded)),
          ],
        ),
        body: BlocBuilder<AdminHomeBloc, AdminHomeState>(
            builder: (context, state) {
          if (state is AdminHomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdminHomeLoadedState) {
            if(state.studentList.isEmpty){
            return const SizedBox(
            child: Center(
              child: Text('Oops no current requests'),
            ),
          );  
            }
            return ListView.builder(
              itemCount: state.studentList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).colorScheme.primary.withAlpha(150),
                          Theme.of(context).colorScheme.secondary,
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AdminHomePageUserName(
                          name: state.studentList[index].name,
                        ),
                        AdminHomePageUserEmail(
                          email: state.studentList[index].email,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AdminHomePageAcceptButton(
                              student: state.studentList[index],
                            ),
                            HomePageDeclineButton(
                              student: state.studentList[index],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox(
            child: Center(
              child: Text('Oops no current requests'),
            ),
          );
        }));
  }
}
