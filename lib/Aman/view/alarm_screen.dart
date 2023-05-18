import 'package:flutter/material.dart';
import 'package:medicinereminder/Aman/model/alarm.dart';
import 'package:medicinereminder/Aman/provider/alarm_state.dart';
import 'package:medicinereminder/Aman/service/alarm_scheduler.dart';
import 'package:provider/provider.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key, required this.alarm}) : super(key: key);

  final Alarm alarm;

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // TODO: 음악 재생하기
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
    final alarmState = context.read<AlarmState>();
    final callbackAlarmId = alarmState.callbackAlarmId!;
    // The alarm callback ID is added by `AlarmScheduler` for day (0), month (1), Tuesday (2), ..., Saturday (6).
    // Therefore, the quotient divided by 7 represents the day of the week.
    final firedAlarmWeekday = callbackAlarmId % 7;
    final nextAlarmTime =
        widget.alarm.timeOfDay.toComingDateTimeAt(firedAlarmWeekday);

    await AlarmScheduler.reschedule(callbackAlarmId, nextAlarmTime);

    alarmState.dismiss();
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _dismissAlarm,
              child: const Text('alarm off'),
            ),
          ],
        ),
      ),
    );
  }
}
