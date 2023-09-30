import 'package:book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../../core/constants/app_color.dart';
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
                'Book Appointment',
                style: Style.textStyle22.copyWith(color: kMainColor , fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
              child: Text(
                'Book on appointment with \n a right doctor ',
                style: Style.textStyle16.copyWith(color: kMainColor , fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
