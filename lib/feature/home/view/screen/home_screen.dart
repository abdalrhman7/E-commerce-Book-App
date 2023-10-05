import 'package:book_store/core/widgets/CustomCircularProgressIndicator.dart';
import 'package:book_store/feature/home/business_logic/best_seller_cubit/best_seller_cubit.dart';
import 'package:book_store/feature/home/business_logic/category_cubit/category_cubit.dart';
import 'package:book_store/feature/home/business_logic/new_arrival_cubit/new_arrival_cubit.dart';
import 'package:book_store/feature/home/date/model/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../date/model/products.dart';
import '../widget/banner_slider.dart';
import '../widget/category_item.dart';
import '../widget/category_text.dart';
import '../widget/products_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const BannerSlider(),
            SizedBox(height: 10.h),
            buildBestSellerBlocBuilder(),
            buildCategoryBlocBuilder(),
            buildNewArrivalBlocBuilder()
          ],
        ),
      ),
    );
  }

  Widget buildBestSellerBlocBuilder() {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
          if (state is BestSellerError) {
            return Center(child: Text(state.errMessage));
          } else if (state is BestSellerSuccess) {
            return buildProductsItemListView('Best Seller', state.products);
          }
          return const CustomCircularProgressIndicator();
        });
  }

  Widget buildCategoryBlocBuilder() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryError) {
          return Center(child: Text(state.errMessage));
        } else if (state is CategorySuccess) {
          return buildCategoryListView(state.categories);
        }
        return const SizedBox();
      },
    );
  }

  Widget buildCategoryListView(List<Category> category) {
    return Column(
      children: [
        const DepartmentName(title: 'Categories'),
        SizedBox(
          height: .20.sh,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 0.r,  horizontal: 8.r),
              child: CategoryItem(category: category[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNewArrivalBlocBuilder() {
    return BlocBuilder<NewArrivalCubit, NewArrivalState>(
      builder: (context, state) {
        if (state is NewArrivalError) {
          return Center(child: Text(state.errMessage));
        } else if (state is NewArrivalSuccess) {
          return buildProductsItemListView('New Arrival', state.products);
        }
        return const SizedBox();
      },
    );
  }




  Widget buildProductsItemListView(String departmentName, List<Books> products) {
    return Column(
      children: [
        DepartmentName(title: departmentName),
        SizedBox(
          height: 0.35.sh,
          child: ListView.builder(
            itemCount: products.length,
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(8.r),
              child: ProductItem(product: products[index]),
            ),
          ),
        ),
      ],
    );
  }
}
