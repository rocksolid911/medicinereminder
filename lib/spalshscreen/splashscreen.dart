import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/common/storage.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    final authPro = ref.read(authProvider);
    Future.delayed(const Duration(seconds: 3), () {
     _checkUid();
    });
    super.initState();
  }
  _checkUid() async {
    final SecureStorage secureStorage = SecureStorage();
    var uid = await secureStorage.readSecureData('uid');
    uid == null
        ?   Navigator.pushReplacementNamed(context, '/welcomeScreen')
        :  Navigator.pushReplacementNamed(context, '/home');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}
