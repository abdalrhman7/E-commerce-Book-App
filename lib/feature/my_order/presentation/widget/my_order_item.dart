import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/text_style.dart';
import '../../data/model/my_order_model.dart';
import 'build_rich_text.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({
    super.key,
    required this.order,
  });

  final MyOrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textBaseline: TextBaseline.ideographic,
              children: [
                BuildRichText(
                    text: 'Order number', title: '${order.orderCode}'),
                const Spacer(),
                Text(
                  '${order.orderDate}',
                  style: Style.textStyle14.copyWith(
                      fontWeight: FontWeight.bold, color: kGreyTextColor),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            const BuildRichText(text: 'Tracking number', title: '12345'),
            SizedBox(height: 8.h),
            Row(
              children: [
                const BuildRichText(text: 'Quantity', title: '3'),
                const Spacer(),
                BuildRichText(text: 'Total Amount', title: '${order.total} LE'),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 80.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50.w)),
                  child: Text(
                    'Details',
                    style:
                        Style.textStyle14.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Text(order.status!,
                    style: Style.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
