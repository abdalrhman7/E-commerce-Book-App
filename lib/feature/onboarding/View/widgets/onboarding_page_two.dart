import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/text_style.dart';

PageModel onBoardingPageTwo() {
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45.0,
                vertical: 90.0,
              ),
              child: Image.asset(
                  AppAssets.onBoardingPageThree,
              ),
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 45.0),
              child: Text(
                'Track your orders',
                style: Style.textStyle22.copyWith(color: kSecondaryColor , fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
             Padding(
              padding:const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'and receive notifications about exclusive offers and discounts.',
                style: Style.textStyle16.copyWith(color: kSecondaryColor , fontWeight: FontWeight.bold , overflow: TextOverflow.visible),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


