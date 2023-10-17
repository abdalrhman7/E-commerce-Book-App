import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../../home/date/model/products.dart';
import '../widget/add_to_cart_bloc_consumer.dart';
import '../widget/build_category_and_price_widget.dart';
import '../widget/favorite_bloc_consumer.dart';
import '../widget/product_details_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Books product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Books product = widget.product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.r),
            child: const Icon(Icons.share),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsImage(product: product),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FavoriteButtonBlocConsumer(productId: product.id!),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name!,
                        style: Style.textStyle22
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      CategoryAndPriceRow(product: product),
                      SizedBox(height: 10.h),
                      Text(
                        product.description!,
                        style: Style.textStyle14.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      AddToCartBlocConsumer(productId: product.id!),
                      SizedBox(height: 14.h),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
