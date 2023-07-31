import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/provider/permission_provider.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:provider/provider.dart';

class PermissionRequestScreen extends ConsumerStatefulWidget {
  const PermissionRequestScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
 ConsumerState createState() => PermissionRequestScreenState();
}

class PermissionRequestScreenState extends ConsumerState<PermissionRequestScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      final permissionPro = ref.read(permissionProvider);
      permissionPro.requestSystemAlertWindow();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final permissionPro = ref.watch(permissionProvider);

    return Scaffold(

      body: permissionPro.isGrantedAll()
          ? widget.child
          : Center(
              child: ElevatedButton(
                onPressed: () {
                  permissionPro.requestSystemAlertWindow();
                },
                child: const Text('Request Permission'),
              ),
            ),
    );
  }
}
