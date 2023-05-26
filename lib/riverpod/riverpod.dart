import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/model/alarm.dart';
import 'package:medicinereminder/Aman/provider/alarm_list_provider.dart';
import 'package:medicinereminder/Aman/provider/alarm_state.dart';
import 'package:medicinereminder/Aman/provider/permission_provider.dart';
import 'package:medicinereminder/auth/authprovider.dart';
import 'package:medicinereminder/home/repo/homeprovider.dart';
import 'package:medicinereminder/intropage/introprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';
final introProvider = ChangeNotifierProvider<IntroRepo>((ref) {
  return IntroRepo();
});
final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});
final homeProvider = ChangeNotifierProvider<HomeProvider>((ref) {
  return HomeProvider();
});
final alarmProvider = ChangeNotifierProvider<AlarmListProvider>((ref) {
  return AlarmListProvider();
});
final permissionProvider = ChangeNotifierProvider<PermissionProvider>((ref) {
  return PermissionProvider();
});
final alarmStateProvider = ChangeNotifierProvider<AlarmState>((ref) {
  return AlarmState();
});