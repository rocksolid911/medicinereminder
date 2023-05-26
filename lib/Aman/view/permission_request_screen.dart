import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicinereminder/Aman/provider/permission_provider.dart';
import 'package:medicinereminder/riverpod/riverpod.dart';
import 'package:provider/provider.dart';

class PermissionRequestScreen extends ConsumerWidget {
  const PermissionRequestScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final permissionPro = ref.watch(permissionProvider);
    return Scaffold(
      body: permissionPro.isGrantedAll()
          ? child
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
