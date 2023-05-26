import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:medicinereminder/common/storage.dart';
import 'package:medicinereminder/main.dart';

import '../screen/gg.dart';

class HomeProvider extends ChangeNotifier {
  final int helloAlarmID = 0;
  final BuildContext? _context = null;

  SecureStorage secureStorage = SecureStorage();
   String _username = '';
  String get userName => _username;
   setUserName()  async{
    _username=await secureStorage.readSecureData('userName');
    notifyListeners();
  }

 // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  //late Map<String,dynamic> p = {"con": context};
  // datePicker(context){
  //   DatePicker.showDatePicker(context,
  //       showTitleActions: true,
  //       minTime: DateTime(2018, 3, 5),
  //       maxTime: DateTime(2019, 6, 7), onChanged: (date) {
  //         print('change $date');
  //       }, onConfirm: (date) async{
  //         print('confirm $date');
  //         await AndroidAlarmManager.periodic(const Duration(minutes: 1), helloAlarmID, printHello);
  //       }, currentTime: DateTime.now(),locale: LocaleType.en) ;
  // }
  // timePicker(context){
  //   //context = contex!;
  //   DatePicker.showTimePicker(context,
  //       showTitleActions: true,
  //       onChanged: (date) {
  //         print('change $date');
  //       }, onConfirm: (date)async {
  //         print('confirm $date');
  //         await AndroidAlarmManager.oneShotAt(
  //             DateTime(2023, 4, 30, 21, 56, 0, 0, 0,),
  //             helloAlarmID,
  //             printHello2,
  //             exact: true,
  //             wakeup: true,
  //             rescheduleOnReboot: true,
  //         );
  //       }, currentTime: DateTime.now(),locale: LocaleType.en) ;
  // }
  // @pragma('vm:entry-point')
  // static void printHello() {
  //   final DateTime now = DateTime.now();
  //   final int isolateId = Isolate.current.hashCode;
  //   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
  // }
  // @pragma('vm:entry-point')
  //    void printHello2(cont) async{
  //   final DateTime now = DateTime.now();
  //   final int isolateId = Isolate.current.hashCode;
  //
  //   WidgetsFlutterBinding.ensureInitialized();
  //   OverlayState overlayState = Overlay.of(context);
  //   OverlayEntry overlayEntry = OverlayEntry(
  //     builder: (BuildContext context) => AlertDialog(
  //       title: Text('Alarm'),
  //       content: Text('The alarm has fired!'),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text('OK'),
  //           onPressed: () {
  //             overlayEntry.remove();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //   overlayState.insert(overlayEntry);
  //   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
  // }
  //  onAlarmStopped() {
  //   AndroidAlarmManager.cancel(helloAlarmID);
  // }
  // moveToNextScreen(context){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => Gh()),
  //   );

}
