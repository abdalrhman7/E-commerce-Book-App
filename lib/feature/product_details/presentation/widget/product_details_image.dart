import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/date/model/products.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
    required this.product,
  });

  final Books product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .35.sh,
      width: double.infinity,
      child: FancyShimmerImage(
        width: double.infinity,
        errorWidget: const Icon(Icons.error),
        imageUrl: product.image!,
        boxFit: BoxFit.fill,
      ),
    );
  }
}