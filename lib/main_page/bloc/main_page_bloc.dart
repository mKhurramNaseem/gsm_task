
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gsm_task/admin_module/admin_home/views/admin_home_page.dart';
import 'package:gsm_task/main_page/bloc/main_page_events.dart';
import 'package:gsm_task/main_page/bloc/main_page_states.dart';
import 'package:gsm_task/student_module/student_status/student_status_page.dart';

class MainPageBloc extends Bloc<MainPageEvent , MainPageState>{
  MainPageBloc():super(MainPageInitialState()){
    on<SetNotificationChannelEvent>(_mapEventToState);
  }



  FutureOr<void> _mapEventToState(SetNotificationChannelEvent event, Emitter<MainPageState> emit) async{
    await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
    
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');    
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin
        .initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    ); 
    FirebaseMessaging.onMessage.listen((event) {
      AndroidNotificationDetails details =
            const AndroidNotificationDetails('my_channel_id', 'my_channel_name',
                channelDescription: 'base_channel',
                importance: Importance.high,
                priority: Priority.high,
                autoCancel: true,                
                                ticker: 'ticker');
      flutterLocalNotificationsPlugin.show(0, event.notification!.title,event.notification!.body , NotificationDetails(android: details));
     });
     FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      Map<String , dynamic> map = remoteMessage.data;
      Map<String , String> mapSecond = map['data'];
      if(mapSecond['type'] == 'toAdmin'){
        Navigator.of(event.context).pushNamed(AdminHomePageDesign.pageName);
      }else{
        Navigator.of(event.context).pushNamed(StudentStatusPage.pageName);
      }
      });
  }
}