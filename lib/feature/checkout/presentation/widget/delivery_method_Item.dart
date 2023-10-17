import 'package:book_store/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DeliveryMethodItem extends StatelessWidget {
  const DeliveryMethodItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.w),
        color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(
           'https://cdn6.aptoide.com/imgs/8/f/1/8f128e9693424bb764e2e599364905b7_icon.png',
            fit: BoxFit.cover,
            height: 28.h,
          ),
          const SizedBox(height: 6.0),
          Text(
            '2-3 days',
            style: Style.textStyle12.copyWith(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}