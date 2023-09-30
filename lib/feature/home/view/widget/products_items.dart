import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/text_style.dart';
import '../../date/model/products.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context, rootNavigator: true).pushNamed(
        //   AppRoutes.productDetails,
        //   arguments: {'product': product},
        // );
      },
      child: SizedBox(
        width: 0.2.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProductImg(),
            SizedBox(height: 6.h),
            Text(product.name!,
                style: Style.textStyle16.copyWith(fontWeight: FontWeight.bold)),
            Text(product.category!, style: Style.textStyle14.copyWith(fontWeight: FontWeight.w500)),
            Text(product.price!,
                style: Style.textStyle14
                    .copyWith(decoration: TextDecoration.lineThrough , color: Colors.grey)),
            Text('${product.priceAfterDiscount!}',
                style: Style.textStyle14.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget buildProductImg() {
    return Stack(
      children: [
        SizedBox(
          height: 0.2.sh,
          width: 0.2.sh,
          child: FancyShimmerImage(
            width: double.infinity,
            errorWidget: const Icon(Icons.error),
            imageUrl: product.image!,
            boxFit: BoxFit.fill,
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
                  style: Style.textStyle14.copyWith(color: Colors.white , fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
