import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod/riverpod.dart';

class Gh extends ConsumerStatefulWidget {
  const Gh({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _GhState();
}

class _GhState extends ConsumerState<Gh> {
  @override
  Widget build(BuildContext context) {
    final homePro = ref.watch(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gh Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          //  homePro.onAlarmStopped();
            Navigator.pop(context);
           // Navigator.pushNamed(context, '/gg');
          },
          child: const Text("Go to gg"),
        ),
      ),
    );
  }
}
