import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class BooksTypeListView extends StatelessWidget {
  const BooksTypeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    List<String> dummyCategory = [
      'Programing',
      'novels',
      'Programing',
      'novels',
      'Programing',
    ];
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: dummyCategory.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.w),
                color: Colors.black87,
              ),
              child: Center(
                  child: Text(dummyCategory[index],
                      style: Style.textStyle16.copyWith(
                        color: Colors.white,
                      ))),
            ),
          );
        },
      ),
    );
  }
}