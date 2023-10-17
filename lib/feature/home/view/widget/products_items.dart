import 'package:book_store/feature/home/view/widget/product_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_route/routes.dart';
import '../../../../core/theme/text_style.dart';
import '../../date/model/products.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Books product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          AppRoutes.detailsScreen,
          arguments: {'product': product},
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.w)),
        width: 0.2.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImg(product: product),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name!,
                      style: Style.textStyle16
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text(product.category!,
                      style: Style.textStyle14
                          .copyWith(fontWeight: FontWeight.w500)),
                  Text(product.price!,
                      style: Style.textStyle14.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey)),
                  Text('${product.priceAfterDiscount!}',
                      style: Style.textStyle14
                          .copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}


