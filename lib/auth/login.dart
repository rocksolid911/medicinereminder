import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Log In Page',
            ),
          ],
        ),
      ),
    );
  }
}
