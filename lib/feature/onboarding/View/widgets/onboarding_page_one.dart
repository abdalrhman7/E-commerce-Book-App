import 'package:book_store/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/constants/assets.dart';

PageModel onBoardingPageOne() {
  return PageModel(
    widget: DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.0,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset(
                AppAssets.onBoardingPageTwo,
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Get Programing Book',
                style: Style.textStyle22.copyWith(color: blue , fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
