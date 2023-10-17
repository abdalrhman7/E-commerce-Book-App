import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../date/model/products.dart';

class ProductImg extends StatelessWidget {
  const ProductImg({
    super.key,
    required this.product,
  });

  final Books product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 0.2.sh,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.w),
                topRight: Radius.circular(12.w)),
            child: FancyShimmerImage(
              width: double.infinity,
              errorWidget: const Icon(Icons.error),
              imageUrl: product.image!,
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
                  '${product.discount!}%',
                  style: Style.textStyle14.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}