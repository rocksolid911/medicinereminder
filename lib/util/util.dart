import 'dart:io';
import 'dart:math';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class Util{
  // static Future<File> urlToFile(String imageUrl) async {
  //   var rng = Random();
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = tempDir.path;
  //   File file = File('$tempPath${rng.nextInt(100)}.png');
  //   http.Response response = await http.get(Uri.parse(imageUrl));
  //   await file.writeAsBytes(response.bodyBytes);
  //   return file;
  // }
  static getFlashBar(context, message) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          controller: controller,
          child: FlashBar(
            content:
            Text(message, textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontFamily: "NimbusRegular", fontSize: 16)),
            margin: const EdgeInsets.all(8),
            controller: controller,
            backgroundColor: const Color(0Xff3f7cff),
            position: FlashPosition.top,
          ),
        );
      },
    );
  }

  static displayLoader(bool loading, context) {
    return loading == true
        ? showDialog(
        builder: (context) => const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color((0Xff3f7cff))))),
        barrierDismissible: false,
        context: context)
        : Navigator.pop(context);
  }

  static latestLoader(context, bool status) {
    return status
        ? showDialog(
        builder: (context) => Center(
          child: Visibility(
            visible: status,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(
                  (0Xff3f7cff),
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
        context: context)
        : Navigator.of(context, rootNavigator: true).pop();
  }
}