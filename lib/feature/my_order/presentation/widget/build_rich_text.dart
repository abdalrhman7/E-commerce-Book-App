import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/text_style.dart';

class BuildRichText extends StatelessWidget {
  const BuildRichText({
    super.key,
    required this.text,
    required this.title,
  });
  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: '$text : ',
              style: Style.textStyle14.copyWith(color: greyText)),
          TextSpan(
              text: title,
              style: Style.textStyle14
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}