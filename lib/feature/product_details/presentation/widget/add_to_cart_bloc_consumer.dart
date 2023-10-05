import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/main_snack_bar.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/main_button.dart';
import '../../business_logic/add_to_cart_cubit/add_to_cart_cubit.dart';

class AddToCartBlocConsumer extends StatelessWidget {
  const AddToCartBlocConsumer({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          mainSnackBar(
            context: context,
            title: 'Item Added to Cart',
            success: true,
          );
        }
        if (state is AddToCartError) {
          mainSnackBar(
            context: context,
            title: 'Could\'t add to cart Try again later',
            success: false,
          );
        }
      },
      builder: (context, state) {
        if (state is AddToCartLoading) {
          return const CustomCircularProgressIndicator();
        }
        return MainButton(
          onTap: () {
            BlocProvider.of<AddToCartCubit>(context)
                .addToCart(productId: productId);
          },
          text: 'Add To Cart',
        );
      },
    );
  }
}