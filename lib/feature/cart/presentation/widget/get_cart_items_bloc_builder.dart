import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';
import '../../data/model/cart_model.dart';
import 'cart_list_item.dart';

class GetCartItemsBlocBuilder extends StatelessWidget {
  const GetCartItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
      previous != current && current is GetCartSuccess,
      builder: (context, state) {
        if (state is GetCartError) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetCartSuccess) {
          return buildGetAllCartProductWidget(state.carts);
        }
        return const CustomCircularProgressIndicator();
      },
    );
  }

  Widget buildGetAllCartProductWidget(List<CartItems> cartItems) {
    return SizedBox(
      height: .55.sh,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cartItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CartListItem(cartItems: cartItems[index]);
        },
      ),
    );
  }
}