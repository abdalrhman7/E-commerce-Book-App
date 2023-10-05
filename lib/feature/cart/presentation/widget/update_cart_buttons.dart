import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';
import '../../data/model/cart_model.dart';

class UpdateCartButtons extends StatelessWidget {
  const UpdateCartButtons({super.key, required this.cartItems});

  final CartItems cartItems;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CartCubit>(context);
    return Row(
      children: [
        iconButtonWidget(
          const Icon(Icons.remove),
          () => cubit.updateQuantity(
            itemId: cartItems.itemId!,
            quantity: cartItems.itemQuantity!,
            isIncrement: false,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          '${cartItems.itemQuantity!}',
          style: Style.textStyle12.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 6.w),
        iconButtonWidget(
          const Icon(Icons.add),
          () => cubit.updateQuantity(
            itemId: cartItems.itemId!,
            quantity: cartItems.itemQuantity!,
            isIncrement: true,
          ),
        ),
      ],
    );
  }

  Widget iconButtonWidget(Icon icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.w),
          color: Colors.grey[200],
        ),
        child: icon,
      ),
    );
  }
}
