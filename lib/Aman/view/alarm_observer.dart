import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/model/alarm.dart';
import 'package:medicinereminder/Aman/provider/alarm_list_provider.dart';
import 'package:medicinereminder/Aman/provider/alarm_state.dart';
import 'package:medicinereminder/Aman/service/alarm_polling_worker.dart';
import 'package:medicinereminder/Aman/view/alarm_screen.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:provider/provider.dart';

class AlarmObserver extends ConsumerStatefulWidget {
  final Widget child;

  const AlarmObserver({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  AlarmObserverState createState() => AlarmObserverState();
}

class AlarmObserverState extends ConsumerState<AlarmObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
   // final context = ref.read(alarmStateProvider.notifier);
    switch (state) {
      case AppLifecycleState.resumed:
        AlarmPollingWorker().createPollingWorker(ref.read(alarmStateProvider.notifier));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? alarmScreen;
    final alarmListProvider = ref.watch(alarmProvider);
    final alarmState = ref.watch(alarmStateProvider);
    if(alarmState.isFired){
      final callbackId = alarmState.callbackAlarmId;
      Alarm? alarm = alarmListProvider.getAlarmBy(callbackId!);
      if(alarm != null){
        alarmScreen = AlarmScreen(alarm: alarm);
      }
    }
    return IndexedStack(
      index: alarmScreen == null ? 0 : 1,
      children: [
        widget.child,
        alarmScreen ?? Container(),
      ],);
  }
}
