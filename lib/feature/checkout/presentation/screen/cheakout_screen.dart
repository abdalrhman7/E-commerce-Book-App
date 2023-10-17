import 'package:book_store/core/theme/text_style.dart';
import 'package:book_store/feature/checkout/presentation/widget/shipping_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cart/presentation/widget/delivery_method.dart';
import '../widget/cheakout_order_details.dart';
import '../widget/get_governorates_bloc_builder.dart';
import '../widget/payment_widget.dart';
import '../widget/submit_order_bloc_consumer.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Style.textStyle14
              .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 14.h),
            Text(
              'Shipping address',
              style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 14.h),
            const ShippingAddressWidget(),
            SizedBox(height: 14.h),
            const GetGovernoratesBlocBuilder(),
            SizedBox(height: 14.h),
            const PaymentWidget(),
            SizedBox(height: 14.h),
            const DeliveryMethod(),
            SizedBox(height: 14.h),
            const CheckoutOrderDetails(),
            SizedBox(height: 0.1.sh),
            const SubmitOrderBlocConsumer(),
          ],
        ),
      ),
    );
  }
}


