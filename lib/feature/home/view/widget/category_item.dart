import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../date/model/Category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.14.sh,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: .14.sh,
            width: 0.14.sh,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w), color: Colors.grey),
            child: Image.network(
                'https://www.pngmart.com/files/15/Antique-Book-Stack-Transparent-Background.png'),
          ),
          Text(
            category.name!,
            textAlign: TextAlign.center,
            style: Style.textStyle16.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible),
          )
        ],
      ),
    );
  }
}
