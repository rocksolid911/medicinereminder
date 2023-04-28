import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/auth/authprovider.dart';
import 'package:medicinereminder/home/repo/homeprovider.dart';
import 'package:medicinereminder/intropage/introprovider.dart';
final introProvider = ChangeNotifierProvider<IntroRepo>((ref) {
  return IntroRepo();
});
final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});
final homeProvider = ChangeNotifierProvider<HomeProvider>((ref) {
  return HomeProvider();
});