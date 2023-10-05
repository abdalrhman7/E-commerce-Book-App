import 'package:book_store/feature/checkout/business_logic/checkout_model/checkout_cubit.dart';
import 'package:book_store/feature/checkout/presentation/widget/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
          previous != current && current is GetTotalPriceSuccess,
      builder: (context, state) {
        if (state is GetTotalPriceSuccess) {
          return Column(
            children: [
              OrderSummaryComponent(title: 'Order', value: '${state.price} LE'),
              const SizedBox(height: 8.0),
              const OrderSummaryComponent(title: 'Delivery', value: '20 LE'),
              const SizedBox(height: 8.0),
               OrderSummaryComponent(title: 'Summary', value: '${double.parse(state.price) +20} LE'),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
