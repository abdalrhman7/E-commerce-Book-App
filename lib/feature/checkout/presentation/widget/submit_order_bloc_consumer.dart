import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/main_snack_bar.dart';
import '../../business_logic/checkout_model/checkout_cubit.dart';
import '../../data/model/placeorder_model.dart';

class SubmitOrderBlocConsumer extends StatelessWidget {
  const SubmitOrderBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is SubmitOrderSuccess) {
          mainSnackBar(context: context, title: 'Order Submitted', success: true);
        }
        if (state is SubmitOrderError) {
          mainSnackBar(
              context: context, title: state.errorMessage, success: false);
        }
      },
      builder: (context, state) {
        if (state is SubmitOrderLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          text: 'Submit Order',
          onTap: () {
            if (cubit.selectedCity == null) {
              mainSnackBar(
                  context: context, title: 'Select City First', success: false);
              return;
            }
            SubmitOrder submitOrder = SubmitOrder(
              name: cubit.userName,
              governorateId: cubit.selectedCity!,
              phone: cubit.phone,
              address: cubit.address,
              email: cubit.email,
            );
            cubit.submitOrder(submitOrder);
          },
        );
      },
    );
  }
}