import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../checkout/presentation/widget/delivery_method_Item.dart';

class DeliveryMethod extends StatelessWidget {
  const DeliveryMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery method',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 0.12.sh,
          child: ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) =>  Padding(
              padding: EdgeInsets.all(6.r),
              child: const DeliveryMethodItem(),
            ),
          ),
        ),
      ],
    );
  }
}