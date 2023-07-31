import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/model/alarm.dart';
import 'package:medicinereminder/Aman/provider/alarm_state.dart';
import 'package:medicinereminder/Aman/service/alarm_scheduler.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:provider/provider.dart';

class AlarmScreen extends ConsumerStatefulWidget {
  const AlarmScreen({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  AlarmScreenState createState() => AlarmScreenState();
}

class AlarmScreenState extends ConsumerState<AlarmScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // TODO: play music
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        _dismissAlarm();
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _dismissAlarm() async {
    final alarmState = ref.read(alarmStateProvider.notifier);
    final callbackAlarmId = alarmState.callbackAlarmId!;
    // The alarm callback ID is added by `AlarmScheduler` for day (0), month (1), Tuesday (2), ..., Saturday (6).
    // Therefore, the quotient divided by 7 represents the day of the week.
    final firedAlarmWeekday = callbackAlarmId % 7;
    final nextAlarmTime =
        widget.alarm.timeOfDay.toComingDateTimeAt(firedAlarmWeekday);

    await AlarmScheduler.reschedule(callbackAlarmId, nextAlarmTime);

    alarmState.dismiss();
    print('alarm dismissed');
    if(context.mounted) {
      if (Navigator.of(context).canPop() == true) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final alarmState = ref.watch(alarmStateProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'alarm screen',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed:_dismissAlarm,
              child: const Text('alarm off'),
            ),
          ],
        ),
      ),
    );
  }
}
