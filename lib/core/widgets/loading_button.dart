import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: kMainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.w))),
        child: const CustomCircularProgressIndicator(),
      ),
    );
  }
}
