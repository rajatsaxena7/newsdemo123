// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:toastification/toastification.dart';

Future toastNotification(
  BuildContext context,
  String textTitle,
) async {
  toastification.showCustom(
    context: context, // optional if you use ToastificationWrapper
    autoCloseDuration: const Duration(seconds: 5),
    alignment: Alignment.topRight,
    builder: (BuildContext context, ToastificationItem holder) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textTitle,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    },
  );
}
