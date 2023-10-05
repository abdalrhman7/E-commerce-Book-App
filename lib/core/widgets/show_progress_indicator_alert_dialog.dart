import 'package:flutter/material.dart';

import 'CustomCircularProgressIndicator.dart';

void showProgressIndicatorAlertDialog(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CustomCircularProgressIndicator(),
    ),
  );
  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}