import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../business_logic/checkout_model/checkout_cubit.dart';
import 'drop_down.dart';

class GetGovernoratesBlocBuilder extends StatelessWidget {
  const GetGovernoratesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
      previous != current && current is GetGovernoratesSuccess,
      builder: (context, state) {
        if (state is GetGovernoratesLoading) {
          return const CustomCircularProgressIndicator();
        } else if (state is GetGovernoratesSuccess) {
          return DropDownMenuWidget(
            hint: 'Select City',
            governorates: state.governorates,
            onChanged: (value) {
              cubit.selectedCity = value;
            },
          );
        } else if (state is GetGovernoratesError) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox();
      },
    );
  }
}