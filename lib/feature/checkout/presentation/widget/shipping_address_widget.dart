import 'package:book_store/core/constants/text_style.dart';
import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:book_store/feature/checkout/business_logic/checkout_model/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
          previous != current && current is GetUserInfoSuccess,
      builder: (context, state) {
        if (state is GetUserInfoLoading) {
          return const CustomCircularProgressIndicator();
        }
        if (state is GetUserInfoSuccess) {
          cubit.email = state.user.userEmail!;
          cubit.address = state.user.address!;
          cubit.phone = state.user.phone!;
          cubit.userName = state.user.userName!;
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.w)),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.user.userName!,
                        style: Style.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Change',
                          style: Style.textStyle14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    state.user.userEmail!,
                    style:
                        Style.textStyle14.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${state.user.phone} , ${state.user.address} ',
                    style: Style.textStyle14.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is GetUserInfoError) {
          return Center(child: Text(state.errMessage));
        }
        return const SizedBox();
      },
    );
  }
}
