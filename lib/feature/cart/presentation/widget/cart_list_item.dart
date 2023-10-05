import 'package:book_store/core/constants/app_color.dart';
import 'package:book_store/feature/cart/business_logic/cart_cubit/cart_cubit.dart';
import 'package:book_store/feature/cart/presentation/widget/update_cart_buttons.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../../data/model/cart_model.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartItems});
  final CartItems cartItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .18.sh,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.w),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.w),
                      bottomLeft: Radius.circular(18.w)),
                  child: SizedBox(
                    height: double.infinity,
                    width: 0.14.sh,
                    child: FancyShimmerImage(
                      width: double.infinity,
                      errorWidget: const Icon(Icons.error),
                      imageUrl: cartItems.itemProductImage!,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6.r),
                  child: SizedBox(
                    width: 40.w,
                    height: 20.h,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          '${cartItems.itemProductDiscount!}%',
                          style: Style.textStyle14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 8.w),
            Container(
              constraints: BoxConstraints(maxWidth: 0.18.sh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    cartItems.itemProductName!,
                    maxLines: 2,
                    style: Style.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  UpdateCartButtons(cartItems: cartItems),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 8.r, right: 8.r, bottom: 8.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(Icons.delete_outline_outlined,
                        color: kMainColor),
                    onTap: () => BlocProvider.of<CartCubit>(context)
                        .removeFromCart(cartItems.itemId!),
                  ),
                  Text(
                    cartItems.itemProductPrice!,
                    style:
                        Style.textStyle14.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
