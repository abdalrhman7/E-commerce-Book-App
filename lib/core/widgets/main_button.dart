import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  final Color? color;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: redAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.w))),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
