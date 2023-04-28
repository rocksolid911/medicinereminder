import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:medicinereminder/util/util.dart';

class LogInPage extends ConsumerStatefulWidget {
  const LogInPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LogInPageState();
}

class _LogInPageState extends ConsumerState<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final authPro = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            GoogleAuthButton(
              onPressed: () async{
                Util.displayLoader(true, context);
                await authPro.authGoogle();
                Util.displayLoader(false, context);
                if (authPro.isAuth) {
                  Navigator.pushNamed(context, '/home');
                }else{
                  Util.getFlashBar(context, "login faild");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
