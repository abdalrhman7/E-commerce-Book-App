import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Style.textStyle22.copyWith(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ],
      ),
    );
  }
}