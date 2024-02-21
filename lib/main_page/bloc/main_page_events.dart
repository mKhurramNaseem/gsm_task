import 'package:flutter/material.dart';

@immutable
abstract class MainPageEvent{
  const MainPageEvent();
}

@immutable
class SetNotificationChannelEvent extends MainPageEvent{
  final BuildContext context;
  const SetNotificationChannelEvent({required this.context});
}