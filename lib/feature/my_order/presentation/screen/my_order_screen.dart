import 'package:book_store/feature/my_order/business_logic/my_order_cubit/my_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_style.dart';
import '../../../../core/widgets/CustomCircularProgressIndicator.dart';
import '../../../../core/widgets/search_bar_widget.dart';
import '../widget/my_order_item.dart';
import '../widget/status_list_view.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarWidget(),
              SizedBox(height: 8.h),
              Text(
                'My Orders',
                style: Style.textStyle30.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              const StatusListView(),
              SizedBox(height: 14.h),
              Expanded(
                child: BlocBuilder<MyOrderCubit, MyOrderState>(
                  builder: (context, state) {
                    if (state is GetMyOrderError) {
                      return Center(child: Text(state.errorMessage));
                    }
                    if (state is GetMyOrderSuccess) {
                      return ListView.separated(
                        itemCount: state.myOrders.length,
                        separatorBuilder: (_, index) => SizedBox(height: 8.h),
                        itemBuilder: (_, index) =>
                            MyOrderItem(order: state.myOrders[index]),
                      );
                    }
                    return const CustomCircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
