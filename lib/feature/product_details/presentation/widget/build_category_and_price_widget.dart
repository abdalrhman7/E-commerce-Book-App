import 'package:book_store/feature/home/date/model/products.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';

class CategoryAndPriceRow extends StatelessWidget {
  const CategoryAndPriceRow({
    super.key,
    required this.product,
  });
  final Books product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.category!,
            style: Style.textStyle16
                .copyWith(color: greyText, fontWeight: FontWeight.bold)),
        Column(
          children: [
            Text(
              product.price!,
              style: Style.textStyle14.copyWith(
                  color: greyText,
                  decoration: TextDecoration.lineThrough),
            ),
            Text(
              '${product.priceAfterDiscount!}',
              style: Style.textStyle14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
