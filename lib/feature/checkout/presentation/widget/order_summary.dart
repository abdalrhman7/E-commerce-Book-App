import 'package:book_store/core/constants/app_color.dart';
import 'package:book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class OrderSummaryComponent extends StatelessWidget {
  final String title;
  final String value;
  const OrderSummaryComponent({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: Style.textStyle16.copyWith(color: kGreyTextColor),
        ),
        Text(
          value,
          style: Style.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}