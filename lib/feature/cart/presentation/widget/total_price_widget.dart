import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_style.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Amount',
          style: Style.textStyle16
              .copyWith(color: Colors.grey.shade500),
        ),
        buildGetTotalPriceBlocBuilder(context),
      ],
    );
  }

  Widget buildGetTotalPriceBlocBuilder(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
      previous != current && current is GetTotalPriceSuccess,
      builder: (context, state) {
        if (state is GetTotalPriceLoading){
          return const CustomCircularProgressIndicator();
        }
        if (state is GetTotalPriceSuccess){
          return Text(
            state.totalPrice,
            style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
          );
        }
        return const SizedBox();
      },
    );
  }
}

