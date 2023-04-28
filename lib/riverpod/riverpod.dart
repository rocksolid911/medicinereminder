import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/intropage/introprovider.dart';
final introProvider = ChangeNotifierProvider<IntroRepo>((ref) {
  return IntroRepo();
});