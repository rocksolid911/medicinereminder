import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_background_trigger/flutter_alarm_background_trigger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/provider/alarm_state.dart';
import 'package:medicinereminder/Aman/service/alarm_polling_worker.dart';
import 'package:medicinereminder/Aman/view/alarm_observer.dart';
import 'package:medicinereminder/Aman/view/home_screen.dart';
import 'package:medicinereminder/Aman/view/permission_request_screen.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:medicinereminder/router/routes.dart';

import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    importance: Importance.high,
    playSound: true);
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //TODO for we need to use local storage
  //only use for web not for mobile
  if(kIsWeb) {
    final auth = FirebaseAuth.instanceFor(app: Firebase.app(), persistence: Persistence.NONE);
    await auth.setPersistence(Persistence.LOCAL);
  }
 // FlutterAlarmBackgroundTrigger.initialize();


  await AndroidAlarmManager.initialize();
  final AlarmState alarmState = AlarmState();
  AlarmPollingWorker().createPollingWorker(alarmState);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends ConsumerState<MyApp> {
  // @override
  // void initState() {
  //   final alarmListProvider = ref.watch(alarmProvider);
  //   alarmListProvider.init();
  //   final permissionprovider = ref.watch(permissionProvider);
  //   permissionprovider.init();
  //   super.initState();
  // }
  // @override
  // void didChangeDependencies() {
  //   final alarmListProvider = ref.watch(alarmProvider);
  //   alarmListProvider.init();
  //   final permissionprovider = ref.watch(permissionProvider);
  //   permissionprovider.init();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
   // bool isFirst = ref.read(alarmStateProvider.notifier).isFired;
    bool isFirst = true;
    String initialRoute = isFirst ?'/home':'/splashScreen';
    final alarmListProvider = ref.watch(alarmProvider);
    final alarmState = ref.watch(alarmStateProvider);
    final permissionprovider = ref.watch(permissionProvider);
    alarmListProvider.init();
    permissionprovider.init();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const PermissionRequestScreen(child: AlarmObserver(child: HomeScreen())),
      navigatorKey: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MedRreminder extends StatefulWidget {
  const MedRreminder({super.key, required this.title});

  final String title;

  @override
  State<MedRreminder> createState() => _MedRreminderState();
}

class _MedRreminderState extends State<MedRreminder> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
