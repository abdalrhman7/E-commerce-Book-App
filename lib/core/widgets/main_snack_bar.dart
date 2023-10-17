import 'package:flutter/material.dart';

import '../theme/app_color.dart';

void mainSnackBar({required BuildContext context, required String title, required bool success}) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: success ? Colors.green : redAccent,
    content: Text(title),
    duration: const Duration(milliseconds: 1000),
  ));
}
