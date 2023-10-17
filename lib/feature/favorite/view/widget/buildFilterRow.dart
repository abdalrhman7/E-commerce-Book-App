import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';

class BuildFilterRow extends StatelessWidget {
  const BuildFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_list_outlined),
        SizedBox(
          width: 8.w,
        ),
        Text(
          'Filters',
          style: Style.textStyle12,
        ),
        SizedBox(
          width: 50.w,
        ),
        const Icon(Icons.compare_arrows_outlined),
        SizedBox(
          width: 8.w,
        ),
        Text(
          'Price: Lowest to high',
          style: Style.textStyle12,
        ),
        SizedBox(
          width: 50.w,
        ),
        const Icon(Icons.grid_view_rounded),
      ],
    );
  }
}