import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authPro = ref.watch(authProvider);
    final homePro = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
             Text("${authPro.user?.displayName}"),
            ElevatedButton(
              onPressed: () async{
                await authPro.signOutGoogle();
                if (!authPro.isAuth) {
                  Navigator.pushNamed(context, '/login');
                }
              },
              child: const Text("Log Out"),
            ),
        TextButton(
            onPressed: () {
              homePro.datePicker(context);
            },
            child: Text(
              'show date time picker',
              style: TextStyle(color: Colors.blue),
            )),
            TextButton(
                onPressed: () {
                 homePro.timePicker(context);
                },
                child: Text(
                  'show date time picker (Chinese)',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
