import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class StatusListView extends StatelessWidget {
  const StatusListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> dummyStatus = [
      'Delivered',
      'Processing',
      'Cancelled',
    ];
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dummyStatus.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 16.r),
            child: Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.w),
                color: Colors.black87,
              ),
              child: Center(
                child: Text(
                  dummyStatus[index],
                  style: Style.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}