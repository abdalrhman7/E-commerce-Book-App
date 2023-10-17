import 'package:book_store/core/app_route/routes.dart';
import 'package:book_store/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../../../core/widgets/main_button.dart';
import '../../business_logic/cart_cubit/cart_cubit.dart';
import '../widget/get_cart_items_bloc_builder.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widget/total_price_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getAllCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          return BlocProvider.of<CartCubit>(context).getAllCart();
        },
        color: redAccent,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBarWidget(),
                SizedBox(height: 20.h),
                Text(
                  'My Cart',
                  style:
                      Style.textStyle28.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.h),
                const GetCartItemsBlocBuilder(),
                SizedBox(
                  height: 16.h,
                ),
                const TotalPriceWidget(),
                SizedBox(
                  height: 16.h,
                ),
                MainButton(
                  text: 'checkout',
                  onTap: () {
                    Navigator.of(context , rootNavigator: true).pushNamed(AppRoutes.checkoutScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
