// import 'dart:isolate';
//
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_alarm_background_trigger/flutter_alarm_background_trigger.dart';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:medicinereminder/alarm_services.dart';
// import 'package:medicinereminder/home/screen/gg.dart';
// import 'package:medicinereminder/riverpod/riverpod.dart';
// GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _HomePageState();
// }
//
// class _HomePageState extends ConsumerState<HomePage> {
//   final int helloAlarmID = 0;
//   AlarmItem? _alarmItem;
//   DateTime? time;
//   List<AlarmItem> alarms = [];
//
//   @override
//   void initState() {
//     super.initState();
//     reloadAlarms();
//     AlarmService.instance.requestPermission().then((isGranted){
//       if(isGranted){
//         AlarmService.instance.onForegroundAlarmEventHandler((alarm){
//           // Perform your action here such as navigation
//           // This event will be triggered on both cases,
//           // when app is in foreground or background!
//           Navigator.push(context, MaterialPageRoute(builder: (context) => Gh()));
//           print(alarm.length);
//         });
//       }
//     });
//   }
//
//   reloadAlarms() {
//     AlarmService.instance.getAllAlarms().then((alarmsList) => setState(() {
//       alarms = alarmsList;
//       print(alarms[0].time);
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authPro = ref.watch(authProvider);
//     final homePro = ref.watch(homeProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  <Widget>[
//              Text(homePro.userName),
//             ElevatedButton(
//               onPressed: () async{
//                 await authPro.signOutGoogle();
//                 if (!authPro.isAuth) {
//                   Navigator.pushNamed(context, '/login');
//                 }
//               },
//               child: const Text("Log Out"),
//             ),
//         TextButton(
//             onPressed: () {
//              // homePro.datePicker(context);
//             },
//             child: const Text(
//               'show date time picker',
//               style: TextStyle(color: Colors.blue),
//             )),
//             TextButton(
//                 onPressed: () {
//                  timePicker();
//                 },
//                 child: const Text(
//                   'show date time picker (Chinese)',
//                   style: TextStyle(color: Colors.blue),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
//   timePicker(){
//     //context = contex!;
//     DatePicker.showTimePicker(context,
//         showTitleActions: true,
//         onChanged: (date) {
//           print('change $date');
//         },
//         // onConfirm: (date)async {
//         //   print('confirm $date');
//         //   await AndroidAlarmManager.oneShotAt(
//         //     DateTime(2023, 5, 1, 15, 58, 0, 0, 0,),
//         //     helloAlarmID,
//         //     showNotification,
//         //     exact: true,
//         //     wakeup: true,
//         //     rescheduleOnReboot: true,
//         //   );
//         // },
//         onConfirm: (date) {
//           print('confirm $date');
//           time = date;
//           createAlarm();
//         },
//         currentTime: DateTime.now(),
//         locale: LocaleType.en) ;
//   }
//   void createAlarm() async {
//     await AlarmService.instance
//         .addAlarm(time!, uid: "TEST UID", payload: {"holy": "Moly"});
//     reloadAlarms();
//   }
//   }
//
// @pragma('vm:entry-point')
// void printHello2()  {
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//
//
//   print("[$now] Hello, world! isolate=${isolateId} ");
// }
// @pragma('vm:entry-point')
// Future<void> showNotification() async {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   // Initialize the plugin
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//   const InitializationSettings initializationSettings =
//   InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   // Show a dialog to the user
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     'Title',
//     'Message',
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channelId',
//         'channelName',
//         importance: Importance.max,
//         priority: Priority.high,
//         showWhen: false,
//         autoCancel: false,
//       ),
//     ),
//   );
// }