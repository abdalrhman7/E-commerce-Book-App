import 'package:flutter/material.dart';

import '../constants/app_color.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    primaryColor: Colors.redAccent,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: Theme.of(context).textTheme.titleMedium,
      focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(2.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      disabledBorder: const OutlineInputBorder(
        //borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        //borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}
